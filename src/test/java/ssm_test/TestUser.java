package ssm_test;

import com.dimension.dao.BaseNodeMapper;
import com.dimension.dao.CaseMapper;
import com.dimension.pojo.BaseNode;
import com.dimension.pojo.Case;
import com.dimension.pojo.CaseCondition;
import org.apache.pdfbox.cos.COSDocument;
import org.apache.pdfbox.io.RandomAccessFile;
import org.apache.pdfbox.io.RandomAccessRead;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDDocumentInformation;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.*;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/springmvc-servlet.xml",
        "classpath:spring-mybatis.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class TestUser {
    @Resource
    CaseMapper caseMapper;
    @Resource
    BaseNodeMapper baseNodeMapper;

    @Test
    public void user() {

    }

    public void testImport() {
        ImportPoi("D:\\MyWork\\project\\myEclipseProject\\web\\dimension\\采集.xlsx");
    }

    public void ImportPoi(String fileName) {
        // TODO Auto-generated method stub
        List<BaseNode> baseNodes = new ArrayList<BaseNode>();
        Workbook workbook = null;
        File file = new File(fileName);
        try (InputStream fileInputStream = new FileInputStream(file)) {
            if (fileName.endsWith(".xls")) {
                workbook = new HSSFWorkbook(fileInputStream);
            } else {
                workbook = new XSSFWorkbook(fileInputStream);
            }
            Sheet sheet = workbook.getSheetAt(0);
            int firstRow = sheet.getFirstRowNum();
            int lastRow = sheet.getLastRowNum();
            for (int i = firstRow + 1; i < lastRow + 1; i++) {
                Row row = sheet.getRow(i);
                int firstColumn = row.getFirstCellNum();
                int lastColumn = row.getLastCellNum();
                BaseNode baseNode = new BaseNode();
                Map<String, String> single = new HashMap<String, String>();
                for (int j = firstColumn; j < lastColumn; j++) {
                    String key = sheet.getRow(0).getCell(j).getStringCellValue();
                    Cell cell = row.getCell(j);
                    if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                        cell.setCellType(Cell.CELL_TYPE_STRING);
                    }
                    String value = cell.getStringCellValue();
                    single.put(key, value);
                }
                baseNode.setAddress(single.get("地址"));
                baseNode.setNodename(single.get("名称"));
                baseNode.setTableid(4);
                String location = single.get("坐标");
                String[] l = location.split(",");
                baseNode.setLongitude(new BigDecimal(l[0]));
                baseNode.setLatitude(new BigDecimal(l[1]));
                baseNode.setNodetype("1");
                baseNode.setUserid(1);
                baseNode.setCollecttime(new Date());
                //baseNodes.add(baseNode);
                System.out.println(baseNode);
                baseNodeMapper.insertSelective(baseNode);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static final String location = "C:\\Users\\acer\\Desktop\\论文\\案件\\第三个-刑事案件";

    public Date changDate(String s) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.parse(s);
    }

    @Test
    public void testuser() throws ParseException {
        File input = new File(location);

        if (input.isDirectory()) {
            String[] fileList = input.list();
            String[] CaseName = null;
            PDFTextParser ptp = new PDFTextParser();
            List<Case> cases = new LinkedList<>();
            List<String> PDF = new LinkedList<>();
            for (String filename : fileList)
                if (filename.indexOf(".txt") != -1) {
                    CaseName = openFile(filename).split("(\n|\r\n)");
                    break;
                }
            for (String f : fileList) {
                if (f.indexOf(".pdf") != -1) {
                    PDF.add(f);
                }
            }
            int i = 0;
            for (String ss : CaseName) {

                String[] strings = ss.split(" ");
                String pdfTxt = ptp.pdftoText(location + "\\" + PDF.get(i));
                i++;
                if (pdfTxt == null) {
                    System.out.println("PDF to Text Conversion failed.");
                } else {
                    Case case1 = new Case();
                    case1.setCasename(strings[1]);
                    case1.setCasetype(strings[2]);
                    case1.setCasecode(strings[3]);
                    case1.setAbstracts(strings[4]);
                    case1.setBegintime(changDate(strings[5]));
                    case1.setDescription(pdfTxt);
                    case1.setGroupid(1);
                    case1.setDepartmentId(new Long(1));
                    cases.add(case1);
                }

            }
            for (Case case1 : cases) {
                caseMapper.insertSelective(case1);
                ptp.writeTexttoFile(case1.getDescription(), "data/mini/" + case1.getCasename()+".txt");
            }
        }
    }


    public String openFile(String fileName) {
        File file = new File(location + "\\" + fileName);
        StringBuilder stringBuilder = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)))) {
            String s = null;
            int count = 0;
            while ((s = br.readLine()) != null) {
                String ss[] = s.split(":");
                if (ss.length == 1) {
                    count++;
                    if (count == 2) {
                        count = 1;
                        stringBuilder.append("\r\n");
                    }
                    continue;
                }
                stringBuilder.append(" " + ss[1]);
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return stringBuilder.toString().replaceAll("((\r\n)|\n)[\\s\t ]*(\\1)+", "$1");

    }


}

class PDFTextParser {
    PDFParser parser;
    String parsedText;
    PDFTextStripper pdfStripper;
    PDDocument pdDoc;
    COSDocument cosDoc;
    PDDocumentInformation pdDocInfo;

    // PDFTextParser Constructor
    public PDFTextParser() {
    }

    // Extract text from PDF Document
    String pdftoText(String fileName) {
        System.out.println("Parsing text from PDF file " + fileName + "....");
        File f = new File(fileName);
        if (!f.isFile()) {
            System.out.println("File " + fileName + " does not exist.");
            return null;
        }
        try {
            org.apache.pdfbox.io.RandomAccess scratchFile = new RandomAccessFile(f, "rw");
            parser = new PDFParser(scratchFile);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        try {
            parser.parse();
            cosDoc = parser.getDocument();
            pdfStripper = new PDFTextStripper();
            pdDoc = new PDDocument(cosDoc);
            parsedText = pdfStripper.getText(pdDoc);
        } catch (Exception e) {
            System.out
                    .println("An exception occured in parsing the PDF Document.");
            e.printStackTrace();
            try {
                if (cosDoc != null)
                    cosDoc.close();
                if (pdDoc != null)
                    pdDoc.close();
            } catch (Exception e1) {
                e.printStackTrace();
            }
            return null;
        }
        System.out.println("Done.");
        return parsedText;
    }

    // Write the parsed text from PDF to a file
    void writeTexttoFile(String pdfText, String fileName) {
        System.out.println("\nWriting PDF text to output text file " + fileName
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


}


