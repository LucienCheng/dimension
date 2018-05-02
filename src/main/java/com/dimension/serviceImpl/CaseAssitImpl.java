package com.dimension.serviceImpl;

import com.dimension.dao.CaseMapper;
import com.dimension.pojo.Case;
import com.dimension.service.CaseAssist;
import com.hankcs.lda.Corpus;
import com.hankcs.lda.LdaGibbsSampler;
import org.ansj.app.keyword.KeyWordComputer;
import org.ansj.app.keyword.Keyword;
import org.ansj.domain.Result;
import org.ansj.domain.Term;
import org.ansj.splitWord.analysis.NlpAnalysis;
import org.ansj.splitWord.analysis.ToAnalysis;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service("CaseAssitImpl")
public class CaseAssitImpl implements CaseAssist {
    @Resource
    CaseMapper caseMapper;
    private static Corpus corpus = null;
    private static double[][] phi = null;

    @Override
    public double computeCompareCase(String firstText, String secondText) throws IOException {
        int firstId=Integer.parseInt(firstText);
        int secondId=Integer.parseInt(secondText);
        Case firstCase=caseMapper.selectByPrimaryKey(firstId);
        Case secondCase=caseMapper.selectByPrimaryKey(secondId);
        double result = 0.0;
        if (corpus == null) {
            //否则就需要初始化
            computeUseLDA();
        }
        double text1[] = computeText(firstCase.getAbstracts()+firstCase.getCasetype()+firstCase.getDescription());
        double text2[] = computeText(secondCase.getAbstracts()+secondCase.getCasetype()+secondCase.getDescription());
        for (double first : text1)
            System.out.println(first);
        System.out.println("-------------");
        for (double first : text2)
            System.out.println(first);
        double sum = 0.0;
        for (int i = 0; i < text1.length; i++) {
            sum += text1[i] * text2[i];
        }
        double sumText1 = 0.0;
        double sumText2 = 0.0;
        for (int i = 0; i < text1.length; i++) {
            sumText1 += text1[i] * text1[i];
            sumText2 += text2[i] * text2[i];
        }
        double sumLength = Math.sqrt(sumText1) * Math.sqrt(sumText2);
        System.out.println(sum);
        System.out.println("-------------");
        System.out.println(sumLength);
        result = sum / sumLength;
        //直接计算

        return new BigDecimal(Double.valueOf(result)).setScale(6, BigDecimal.ROUND_HALF_UP).doubleValue();

       /* return JsDistance(text1,text2).setScale(6, BigDecimal.ROUND_HALF_UP).doubleValue();*/
    }

    public void computeUseLDA() throws IOException {
        // 1. Load corpus from disk
        corpus = Corpus.load("D:\\MyWork\\project\\myEclipseProject\\web\\dimension\\data\\mini");
        // 2. Create a LDA sampler（Gibbs）
        LdaGibbsSampler ldaGibbsSampler = new LdaGibbsSampler(corpus.getDocument(), corpus.getVocabularySize());
        // 3. 训练为10个主题
        ldaGibbsSampler.gibbs(20);
        // 4. The phi matrix is a LDA model, you can use LdaUtil to explain it.
        phi = ldaGibbsSampler.getPhi();
    }

    /**
     * @param Text
     * @return 是一个文本的向量
     */
    public double[] computeText(String Text) {
        //分词，然后添加到Corpus中
        List<String> doc1 = new ArrayList<String>();
        Result result = NlpAnalysis.parse(replaceBlank(Text));

        List<Term> terms = result.getTerms();
        for (Term term : terms) {
            if (term.getName().length() >=2) {
                doc1.add(term.getName());
            }
        }

        System.out.println(doc1);
        if(doc1.size()==0){
            doc1.add(Text);
        }
       /* KeyWordComputer kwc = new KeyWordComputer(100);
        List<Keyword> keywords=kwc.computeArticleTfidf(Text);
        List<String> doc1 = new ArrayList<String>();
        for(Keyword k:keywords){
            doc1.add(k.getName());
        }*/
        int[] document = Corpus.loadCorpus(doc1, corpus.getVocabulary());
        return LdaGibbsSampler.inference(phi, document);
    }

    public double KLDistance(double[] first, double[] second) {
        double sum = 0.0;
        for (int i = 0; i < first.length; i++) {
            sum += (first[i] * Math.log(first[i] / second[i]));
        }
        return sum;
    }

    public BigDecimal JsDistance(double[] first, double[] second) {
        double[] medians=new double[first.length];
        for(int i=0;i<first.length;i++){
            medians[i]=((first[i]*0.5+second[i]*0.5));
        }
       return new BigDecimal(Double.valueOf((KLDistance(first,medians)*0.5+KLDistance(second,medians)*0.5))) ;
    }
    public static String replaceBlank(String str) {
        String dest = "";
        if (str!=null) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(str);
            dest = m.replaceAll("");
        }
        return dest.replaceAll( "[\\p{P}+~$`^=|<>～｀＄＾＋＝｜＜＞￥×]" , "");
    }
}
