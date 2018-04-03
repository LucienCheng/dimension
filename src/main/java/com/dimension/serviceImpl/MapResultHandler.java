package com.dimension.serviceImpl;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
@Service
public class MapResultHandler  implements ResultHandler {

    @SuppressWarnings("rawtypes")
    private final Map mappedResults = new HashMap();

    @SuppressWarnings({ "unchecked", "rawtypes" })
    @Override
    public void handleResult(ResultContext context) {
        Map map = (Map) context.getResultObject();
        mappedResults.put(map.get("key"), map.get("value"));
    }

    public Map getMappedResults() {
        return mappedResults;
    }

}