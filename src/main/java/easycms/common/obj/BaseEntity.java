/**
 * 
 */
package easycms.common.obj;

import java.io.Serializable;
import java.util.Map;

import com.alibaba.fastjson.annotation.JSONField;
import com.google.common.collect.Maps;

/**
 * Entity支持类
 */
public abstract class BaseEntity<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 实体编号（唯一标识）
     */
    protected Integer id;

    @JSONField(serialize = false)
    protected Pager<T> pager;

    /**
     * 自定义SQL（SQL标识，SQL内容）
     */
    @JSONField(serialize = false)
    protected Map<String, String> sqlMap = Maps.newHashMap();

    public BaseEntity() {

    }

    public BaseEntity(Integer id) {
        this();
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Pager<T> getPager() {
        return pager;
    }

    public void setPager(Pager<T> pager) {
        this.pager = pager;
    }

    public Map<String, String> getSqlMap() {
        return sqlMap;
    }

    public void setSqlMap(Map<String, String> sqlMap) {
        this.sqlMap = sqlMap;
    }
}
