package ssm_test;


import com.dimension.pojo.Case;
import org.ansj.domain.Result;
import org.ansj.domain.Term;
import org.ansj.splitWord.analysis.NlpAnalysis;
import org.junit.Test;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TestImport {

    void writeTexttoFile(String pdfText, String fileName) {
        System.out.println("\nWriting  text to output text file " + fileName
                + "....");
        try {
            PrintWriter pw = new PrintWriter(fileName);
            pw.print(pdfText);
            pw.close();
        } catch (Exception e) {
            System.out
                    .println("An exception occured in writing the pdf text to file.");
            e.printStackTrace();
        }
        System.out.println("Done.");
    }

    @Test
    public void change() {
        File file = new File("data\\mini");
        StringBuilder sb = new StringBuilder();
        for (String filename : file.list()) {
            String s = openFile(filename);
            Result result = NlpAnalysis.parse(replaceBlank(s));
            List<Term> terms = result.getTerms();
            for (Term term : terms) {
                if (term.getName().length() >= 2) {
                    sb.append(term.getName() + " ");
                }
            }
            writeTexttoFile(sb.toString(), "data\\mini\\" + filename);
            sb.delete(0, sb.length());
        }
    }
    @Test
    public void testDouble(){
        double[] i=new double[10];
        for (int t=0;t<i.length;t++)
        System.out.print(i[t]==0.0);
    }

    public String openFile(String fileName) {
        File file = new File("data\\mini" + "\\" + fileName);
        StringBuilder stringBuilder = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)))) {
            String s = null;
            while ((s = br.readLine()) != null) {
                stringBuilder.append(replaceBlank(s));
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return stringBuilder.toString().replaceAll("((\r\n)|\n)[\\s\t ]*(\\1)+", "$1");
    }

    public static String replaceBlank(String str) {
        String dest = "";
        if (str != null) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(str);
            dest = m.replaceAll("");
        }
        return dest.replaceAll("[\\p{P}+~$`^=|<>～｀＄＾＋＝｜＜＞￥×]", "").replaceAll("((\r\n)|\n)[\\s\t ]*(\\1)+", "$1");
    }

}

