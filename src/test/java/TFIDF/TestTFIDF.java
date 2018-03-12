package TFIDF;

import java.util.List;

import org.ansj.domain.Term;
import org.junit.Test;

public class TestTFIDF {
	 @Test
	    public void test() {
	        TFIDFAlgorithm tfidfAlgorithm = new TFIDFAlgorithm();
	        String url = "http://baike.baidu.com/item/Java/85979";
	        String word = "语言";
	        List<Term> terms = tfidfAlgorithm.parse(tfidfAlgorithm.getTextFromUrl(url));
	        System.out.println("[【" + word + "】词频 ] " + tfidfAlgorithm.computeTF(word, terms));
	    }
}
