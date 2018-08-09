package com.springboot.common.util;

import java.io.Serializable;

/**
 * @author wangshibao
 * @ClassName: PageMap.class
 * @Description:对分页的基本数据进行<p>个简单的封</p>
 * @date 2016年6月22日  上午12:14:07
 */
public class PageMap implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private int startNum = 0;//初始页数，默认0，标识第一页
    private int pageSize = 10;// 每页显示的记录数，默认是10
    private int totalRecord = -1;// 总记录数
    private int totalPage;// 总页数

    public int getStartNum() {
        return startNum;
    }

    public void setStartNum(int startNum) {
        this.startNum = startNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
        // 在设置总页数的时候计算出对应的当前页数，在下面的三目运算中加法拥有更高的优先级，所以最后可以不加括号
        int totalPage = totalRecord % pageSize == 0 ? totalRecord / pageSize : totalRecord / pageSize + 1;
        this.setTotalPage(totalPage);
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}