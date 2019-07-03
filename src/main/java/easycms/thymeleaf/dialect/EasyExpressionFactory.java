package easycms.thymeleaf.dialect;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.thymeleaf.context.IExpressionContext;
import org.thymeleaf.expression.IExpressionObjectFactory;

import easycms.util.DataUtils;

public class EasyExpressionFactory implements IExpressionObjectFactory {

	public static final String STRING_UTILS = "stringUtils";
	public static final String DATA_UTILS = "dataUtils";
	private static final StringUtils stringUtils = new StringUtils();
	private static final DataUtils dataUtils = new DataUtils();

	public static final Map<String, Object> ALL_EXPRESSION_OBJECT_MAP = new HashMap<>();
	
	static {
		ALL_EXPRESSION_OBJECT_MAP.put(STRING_UTILS, stringUtils);
		ALL_EXPRESSION_OBJECT_MAP.put(DATA_UTILS, dataUtils);
	}

	@Override
	public Object buildObject(IExpressionContext context, String expressionObjectName) {
		return ALL_EXPRESSION_OBJECT_MAP.get(expressionObjectName);
	}

	@Override
	public Set<String> getAllExpressionObjectNames() {
		return ALL_EXPRESSION_OBJECT_MAP.keySet();
	}

	@Override
	public boolean isCacheable(String arg0) {
		return false;
	}

}
