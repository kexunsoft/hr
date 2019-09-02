package com.kexun.hr.model;

public class Right {

    private int id;
    private String name;
    private String url;
    private int pid;
    private int count;
    private int button;
    private boolean checked;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public int getButton() {
        return button;
    }

    public void setButton(int button) {
        this.button = button;
    }

    @Override
    public String toString() {
        return "Right{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", pid=" + pid +
                ", count=" + count +
                ", button=" + button +
                ", checked=" + checked +
                '}';
    }
}
