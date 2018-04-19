package com.dimension.serviceImpl;

import com.dimension.service.CaseAssist;
import com.hankcs.lda.Corpus;
import com.hankcs.lda.LdaGibbsSampler;
import org.ansj.domain.Result;
import org.ansj.domain.Term;
import org.ansj.splitWord.analysis.NlpAnalysis;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@Service
public class CaseAssitImpl implements CaseAssist {
    private static  Corpus corpus=null;
    private static double[][] phi=null;

    @Override
    public double computeCompareCase(String firstText, String secondText) throws IOException {
        double result = 0.0;
        if (corpus == null) {
            //否则就需要初始化
            computeUseLDA();
        }
        double text1[]=computeText(firstText);
        double text2[]=computeText(secondText);
        double sum=0.0;
        for (int i=0;i<text1.length;i++){
            sum+=text1[i]*text2[i];
        }
        double sumText1=0.0;
        double sumText2=0.0;
        for(int i=0;i<text1.length;i++){
            sumText1+=text1[i]*text1[i];
            sumText2+=text2[i]*text2[i];
        }
        double sumLength=Math.sqrt(sumText1)*Math.sqrt(sumText2);
        result=sum/sumLength;
        //直接计算
        return result;
    }

    public  void computeUseLDA() throws IOException {
        // 1. Load corpus from disk
         corpus = Corpus.load("D:\\MyWork\\project\\myEclipseProject\\web\\dimension\\data\\mini");
        // 2. Create a LDA sampler（Gibbs）
        LdaGibbsSampler ldaGibbsSampler = new LdaGibbsSampler(corpus.getDocument(), corpus.getVocabularySize());
        // 3. 训练为10个主题
        ldaGibbsSampler.gibbs(10);
        // 4. The phi matrix is a LDA model, you can use LdaUtil to explain it.
        phi = ldaGibbsSampler.getPhi();
    }

    /**
     *
     * @param Text
     * @return 是一个文本的向量
     */
    public double[] computeText(String Text) {
        //分词，然后添加到Corpus中
        List<String> doc1 = new ArrayList<String>();
        Result result= NlpAnalysis.parse(Text);
        List<Term> terms=result.getTerms();
        for (Term term:terms) {
            if(term.getName().length()>=1){
                doc1.add(term.getName());
            }
        }
        Corpus corpus1 = new Corpus();
        int[] document= corpus1.addDocument(doc1);
        return LdaGibbsSampler.inference(phi, document);
    }
}
