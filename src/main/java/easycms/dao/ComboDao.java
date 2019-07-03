package easycms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import easycms.base.CrudDao;
import easycms.obj.Combo;

public interface ComboDao extends CrudDao<Combo> {

	List<Combo> findBy(@Param("sql") String sql);
}
