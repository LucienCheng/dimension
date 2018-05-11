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

import com.dimension.pojo.BaseNode;
import com.dimension.serviceImpl.CaseAssitImpl;
import junit.framework.TestCase;
import org.ansj.domain.Result;
import org.ansj.domain.Term;
import org.ansj.splitWord.analysis.NlpAnalysis;
import org.ansj.splitWord.analysis.ToAnalysis;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.Test;
import org.springframework.web.multipart.MultipartFile;


import java.io.*;
import java.math.BigDecimal;
import java.util.*;

/**
 * @author hankcs
 */
public class TestCorpus extends TestCase {
    public void testAddDocument() throws Exception {
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

    public void testAll() throws Exception {
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
        for (int i = 0; i < tp.length; i++) {
            System.out.println(tp[i]);
        }
        //需要展示，概率最高的那个主题的单词分布。
        Map<String, Double> topic = LdaUtil.translate(tp, phi, corpus.getVocabulary(), 30);
        LdaUtil.explain(topic);
    }

    public void testAnsj() throws IOException, ClassNotFoundException {
        String str = "老板 一定会 积极 乐观 心态 老板 老板 心态 影响 企业 风格 老板 中庸 企业 经营 必定 不瘟不火 有功 但求无过 老板 激进 企业 员工 缺乏 足够 安全感 \n" +
                " 以前 老板 事情 嘴边 遇到 事情 必定 反面 论证 得出 结论 原因 可能会 成功 员工 保持 冷静 不免 员工 嘀咕 看来 可能 \n" +
                " 积极 乐观 心态 传递 心态 老板 员工 安全感 觉得 没什么 大不了 放开 手脚 一页       一页";
        String str1 = "老板 一定会 积极 乐观 心态 老板 老板 心态 影响 企业 风格 老板 中庸 企业 经营 必定 不瘟不火 有功 但求无过 老板 激进 企业 员工 缺乏 足够 安全感 \n" +
                " 以前 老板 事情 嘴边 遇到 事情 必定 反面 论证 得出 结论 原因 可能会 成功 员工 保持 冷静 不免 员工 嘀咕 看来 可能 \n" +
                " 积极 乐观 心态 传递 心态 老板 员工 安全感 觉得 没什么 大不了 放开 手脚 一页       一页";

        CaseAssitImpl caseAssit = new CaseAssitImpl();
        caseAssit.computeUseLDA();
        System.out.println(caseAssit.computeCompareCase(str, str1));

    }

    public void testuser()  {
        File file=new File("C:\\Users\\acer\\Desktop\\636608653599531250.txt");
        StringBuilder stringBuilder=new StringBuilder();
        try(BufferedReader br=new BufferedReader(new InputStreamReader(new FileInputStream(file)))) {
            String s=null;
            int count=1;
            while ((s=br.readLine())!=null){
                String ss[]=s.split(":  ");
                if (ss.length==1){
                    count++;
                    if(count==2){
                        count=1;
                        stringBuilder.append("\r\n");
                    }
                    continue;
                }
                stringBuilder.append(" "+ss[1]);
            }
            System.out.println(stringBuilder);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try(BufferedWriter bw=new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file)))){
            bw.write(stringBuilder.toString().replaceAll("((\r\n)|\n)[\\s\t ]*(\\1)+", "$1"));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
