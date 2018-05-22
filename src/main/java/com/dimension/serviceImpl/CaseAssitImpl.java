package com.dimension.serviceImpl;

import com.dimension.dao.CaseMapper;
import com.dimension.pojo.Case;
import com.dimension.service.CaseAssist;
import com.dimension.lda.Corpus;
import com.dimension.lda.LdaGibbsSampler;
import org.ansj.domain.Result;
import org.ansj.domain.Term;
import org.ansj.splitWord.analysis.NlpAnalysis;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.*;
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
    //public static Map<Integer,Case> map=new HashMap<>();

    @Override
    public double computeCompareCase(String firstText, String secondText) throws IOException, ClassNotFoundException {
        int firstId = Integer.parseInt(firstText);
        int secondId = Integer.parseInt(secondText);
        Case firstCase =null;
        Case secondCase =null;
        firstCase=caseMapper.selectByPrimaryKey(firstId);
        secondCase=caseMapper.selectByPrimaryKey(secondId);
       /* firstCase=map.get(firstId);
        secondCase=map.get(secondId);
        if(firstCase==null){
            firstCase=caseMapper.selectByPrimaryKey(firstId);
            map.put(firstId,firstCase);
        }
        if(secondCase==null){
            secondCase=caseMapper.selectByPrimaryKey(secondId);
            map.put(secondId,secondCase);
        }*/
        double result = 0.0;
        if (corpus == null) {
            //否则就需要初始化
            computeUseLDA();
        }
        double text1[] = computeText(firstCase.getAbstracts() + firstCase.getCasetype() + firstCase.getDescription());
        double text2[] = computeText(secondCase.getAbstracts() + secondCase.getCasetype() + secondCase.getDescription());
       for (double first : text1)
            System.out.println(first);
        System.out.println("-------------");
        for (double first : text2)
            System.out.println(first);
        /* double sum = 0.0;
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
        result = sum / sumLength;
        //直接计算

        return new BigDecimal(Double.valueOf(result)).setScale(6, BigDecimal.ROUND_HALF_UP).doubleValue();*/

         return JsDistance(text1,text2).setScale(6, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    @Override
    public double computeCompareCaseText(Case firstCase, Case secondCase) throws IOException, ClassNotFoundException {
        double text1[] = computeText(firstCase.getAbstracts() + firstCase.getCasetype() + firstCase.getDescription());
        double text2[] = computeText(secondCase.getAbstracts() + secondCase.getCasetype() + secondCase.getDescription());
        for (double first : text1)
            System.out.println(first);
        System.out.println("-------------");
        for (double first : text2)
            System.out.println(first);
        return JsDistance(text1,text2).setScale(6, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    public void computeUseLDA() throws IOException, ClassNotFoundException {
        int K=30;
        File file = new File("D:\\MyWork\\project\\myEclipseProject\\web\\dimension\\data\\model"+K+".txt");
        if(!file.exists() ||(file.length() == 0)) {
            // 1. Load corpus from disk
            corpus = Corpus.load("D:\\MyWork\\project\\myEclipseProject\\web\\dimension\\data\\mini");
            // 2. Create a LDA sampler（Gibbs）
            LdaGibbsSampler ldaGibbsSampler = new LdaGibbsSampler(corpus.getDocument(), corpus.getVocabularySize());
            // 3. 训练为10个主题
            ldaGibbsSampler.gibbs(K);
            // 4. The phi matrix is a LDA model, you can use LdaUtil to explain it.
            phi = ldaGibbsSampler.getPhi();
            ObjectOutputStream os = new ObjectOutputStream(
                    new FileOutputStream(file));
            os.writeObject(corpus);// 将User对象写进文件
            os.writeObject(phi);// 将List列表写进文件
            os.close();
        }
        else {
            FileInputStream fis=new FileInputStream(file);
            ObjectInputStream oi=new ObjectInputStream(fis);
            corpus=(Corpus) oi.readObject();
            phi=(double[][]) oi.readObject();
            oi.close();
        }
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
            if (term.getName().length() >= 2) {
                doc1.add(term.getName());
            }
        }


       /* KeyWordComputer kwc = new KeyWordComputer(100);
        List<Keyword> keywords=kwc.computeArticleTfidf(replaceBlank(Text));
        for(Keyword k:keywords){
            doc1.add(k.getName());
        }*/
        System.out.println(doc1);
        if (doc1.size() == 0) {
            doc1.add(Text);
        }
        int[] document = Corpus.loadCorpus(doc1, corpus.getVocabulary());
        return LdaGibbsSampler.inference(phi, document);
    }

    public double KLDistance(double[] first, double[] second) {
        double sum = 0.0;
        for (int i = 0; i < first.length; i++) {
            double t=log(first[i] / second[i],2);
            sum += (first[i] * t);
        }
        return sum;
    }

    public double log(double value, double base) {
        return Math.log(value)/Math.log(base);
    }

    public BigDecimal JsDistance(double[] first, double[] second) {
        double[] medians = new double[first.length];
        for (int i = 0; i < first.length; i++) {
            medians[i] = ((first[i] * 0.5 + second[i] * 0.5));
        }
        return new BigDecimal(Double.valueOf(1.0-(KLDistance(first, medians) * 0.5 + KLDistance(second, medians) * 0.5)));
    }

    public static String replaceBlank(String str) {
        String dest = "";
        if (str != null) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(str);
            dest = m.replaceAll("");
        }
        return dest.replaceAll("[\\p{P}+~$`^=|<>～｀＄＾＋＝｜＜＞￥×]", "");
    }
}
