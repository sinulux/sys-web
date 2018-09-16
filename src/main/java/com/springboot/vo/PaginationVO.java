package com.springboot.vo;

import java.util.List;

/**
 * 分页对象
 */
public class PaginationVO<T> {

    private Integer pageIndex;

    private Integer pageSize;

    private Long total;

    private List<T> data;

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public PaginationVO(Integer pageIndex, Integer pageSize, Long total, List<T> data) {
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
        this.total = total;
        this.data = data;
    }
}
