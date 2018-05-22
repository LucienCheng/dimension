package com.dimension.service;

import com.dimension.pojo.Case;

import java.io.IOException;
import java.math.BigDecimal;

public interface CaseAssist {
double computeCompareCase(String firstText,String secondText) throws IOException, ClassNotFoundException;
double computeCompareCaseText(Case firstCase, Case secondCase) throws IOException, ClassNotFoundException;
}
