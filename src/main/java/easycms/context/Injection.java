package easycms.context;

import java.util.List;

import org.mybatis.guice.XMLMyBatisModule;

import com.google.common.collect.Lists;
import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Module;

public enum Injection {
    
    INSTANCE;

    private Injector injector;

    private Injection() {
        //BatisModule 
        List<Module> modules = Lists.newArrayList();
        modules.add(new XMLMyBatisModule() {
            @Override
            protected void initialize() {
                setEnvironmentId("easycms");
                setClassPathResource("sqlMapConfig.xml");
            }
        });
        injector = Guice.createInjector(modules);
    }

    public Injector getInjector() {
        return injector;
    }
}
