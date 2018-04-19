package ssm_test;

import com.dimension.dao.BaseNodeMapper;
import com.dimension.dao.CaseMapper;
import com.dimension.pojo.BaseNode;
import com.dimension.pojo.CaseCondition;
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

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.math.BigDecimal;
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
        CaseCondition caseCondition = new CaseCondition();
        caseCondition.setRoleId(4);
        caseMapper.searchMapCases(caseCondition, null, null);

    }

@Test
    public void testImport(){
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
                String location=single.get("坐标");
                String[] l=location.split(",");
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
}
