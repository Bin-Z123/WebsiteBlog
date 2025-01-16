package model.Interface;

import java.util.List;

public interface BaseDAO<T,ID> {
	void add(T entity) throws Exception;

	void update(T entity) throws Exception;

	void delete(ID id) throws Exception;

	T getById(ID id) throws Exception;

	List<T> getAll() throws Exception;

	List<T> getAllBySQL(String sql, Object... args) throws Exception;
}