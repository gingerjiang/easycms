package cn.bluejoe.elfinder.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bluejoe.elfinder.controller.Connector;
import cn.bluejoe.elfinder.controller.executor.CommandExecutorFactory;
import cn.bluejoe.elfinder.controller.executor.DefaultCommandExecutorFactory;
import cn.bluejoe.elfinder.controller.executors.MissingCommandExecutor;
import cn.bluejoe.elfinder.impl.DefaultFsService;
import cn.bluejoe.elfinder.impl.DefaultFsServiceConfig;
import cn.bluejoe.elfinder.impl.FsSecurityCheckForAll;
import cn.bluejoe.elfinder.impl.StaticFsServiceFactory;
import cn.bluejoe.elfinder.localfs.LocalFsVolume;

/**
 * ConnectorServlet is an example servlet it creates a Connector on
 * init() and use it to handle requests on doGet()/doPost()
 * 
 * users should extend from this servlet and customize required protected
 * methods
 * 
 * @author bluejoe
 *
 */
@WebServlet("/cms/connector")
public class ConnectorServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// core member of this Servlet
	Connector _connector;

	/**
	 * create a command executor factory
	 * 
	 * @param config
	 * @return
	 */
	protected CommandExecutorFactory createCommandExecutorFactory(ServletConfig config) {
		DefaultCommandExecutorFactory defaultCommandExecutorFactory = new DefaultCommandExecutorFactory();
		defaultCommandExecutorFactory.setClassNamePattern("cn.bluejoe.elfinder.controller.executors.%sCommandExecutor");
		defaultCommandExecutorFactory.setFallbackCommand(new MissingCommandExecutor());
		return defaultCommandExecutorFactory;
	}

	/**
	 * create a connector controller
	 * 
	 * @param config
	 * @return
	 */
	protected Connector createConnector(ServletConfig config) {
		Connector connector = new Connector();

		connector.setCommandExecutorFactory(createCommandExecutorFactory(config));
		connector.setFsServiceFactory(createServiceFactory(config));

		return connector;
	}

	protected DefaultFsService createFsService(ServletConfig config) {
		DefaultFsService fsService = new DefaultFsService();
		fsService.setSecurityChecker(new FsSecurityCheckForAll());

		DefaultFsServiceConfig serviceConfig = new DefaultFsServiceConfig();
		serviceConfig.setTmbWidth(80);

		fsService.setServiceConfig(serviceConfig);
		String path = config.getServletContext().getRealPath("/upload");
		fsService.addVolume("A", createLocalFsVolume("My Files", new File(path + "/tmp/a")));
		//fsService.addVolume("B", createLocalFsVolume("Shared", new File(path + "/tmp/b")));

		return fsService;
	}

	private LocalFsVolume createLocalFsVolume(String name, File rootDir) {
		LocalFsVolume localFsVolume = new LocalFsVolume();
		localFsVolume.setName(name);
		localFsVolume.setRootDir(rootDir);
		return localFsVolume;
	}

	/**
	 * create a service factory
	 * 
	 * @param config
	 * @return
	 */
	protected StaticFsServiceFactory createServiceFactory(ServletConfig config) {
		StaticFsServiceFactory staticFsServiceFactory = new StaticFsServiceFactory();
		DefaultFsService fsService = createFsService(config);

		staticFsServiceFactory.setFsService(fsService);
		return staticFsServiceFactory;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		_connector.connector(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		_connector.connector(req, resp);
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		_connector = createConnector(config);
	}
}
