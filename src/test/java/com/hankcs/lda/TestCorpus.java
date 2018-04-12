/*
 * <summary></summary>
 * <author>He Han</author>
 * <email>hankcs.cn@gmail.com</email>
 * <create-date>2015/1/29 17:22</create-date>
 *
 * <copyright file="TestCorpus.java" company="上海林原信息科技有限公司">
 * Copyright (c) 2003-2014, 上海林原信息科技有限公司. All Right Reserved, http://www.linrunsoft.com/
 * This source is subject to the LinrunSpace License. Please contact 上海林原信息科技有限公司 to get more information.
 * </copyright>
 */
package com.hankcs.lda;

import junit.framework.TestCase;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author hankcs
 */
public class TestCorpus extends TestCase
{
    public void testAddDocument() throws Exception
    {
        List<String> doc1 = new ArrayList<String>();
        doc1.add("hello");
        doc1.add("word");
        List<String> doc2 = new ArrayList<String>();
        doc2.add("hankcs");
        Corpus corpus = new Corpus();
        corpus.addDocument(doc1);
        corpus.addDocument(doc2);
        System.out.println(corpus);
    }

    public void testAll() throws Exception
    {
        // 1. Load corpus from disk
        Corpus corpus = Corpus.load("data/mini");
        // 2. Create a LDA sampler（Gibbs）
        LdaGibbsSampler ldaGibbsSampler = new LdaGibbsSampler(corpus.getDocument(), corpus.getVocabularySize());
        // 3. 训练为10个主题
        ldaGibbsSampler.gibbs(10);
        // 4. The phi matrix is a LDA model, you can use LdaUtil to explain it.
        double[][] phi = ldaGibbsSampler.getPhi();
        //对于每个主题展示的个数，并且主题下的前10个频率的单词。
        Map<String, Double>[] topicMap = LdaUtil.translate(phi, corpus.getVocabulary(), 10);
        LdaUtil.explain(topicMap);
        int[] document = Corpus.loadDocument("data/mini/招聘_1950.txt", corpus.getVocabulary());
        double[] tp = LdaGibbsSampler.inference(phi, document);
        //需要预测的文章，的主题分布
        for (int i=0;i<tp.length;i++){
            System.out.println(tp[i]);
        }
        //需要展示，概率最高的那个主题的单词分布。
        Map<String, Double> topic = LdaUtil.translate(tp, phi, corpus.getVocabulary(), 30);
        LdaUtil.explain(topic);
    }
}
