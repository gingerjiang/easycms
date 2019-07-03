package easycms.thymeleaf.dialect;

import org.thymeleaf.dialect.AbstractDialect;
import org.thymeleaf.dialect.IExpressionObjectDialect;
import org.thymeleaf.expression.IExpressionObjectFactory;

public class EasyDialect extends AbstractDialect implements IExpressionObjectDialect {

	private final IExpressionObjectFactory EXPRESSION_OBJECTS_FACTORY;
	
	public EasyDialect(String name) {
		super(name);
		EXPRESSION_OBJECTS_FACTORY = new EasyExpressionFactory();
	}

	@Override
	public IExpressionObjectFactory getExpressionObjectFactory() {
		return EXPRESSION_OBJECTS_FACTORY;
	}

}
