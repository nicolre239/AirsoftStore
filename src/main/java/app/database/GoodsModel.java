package app.database;

public class GoodsModel {
    protected Integer articool;
    protected String description;
    protected Integer price;
    protected String image;

    public Integer getArticool() {
        return articool;
    }

    public String getDescription() {
        return description;
    }

    public Integer getPrice() {
        return price;
    }

    public String getImage() {
        return image;
    }

    public GoodsModel(int articool, String description, int price, String image) {
        this.articool = articool;
        this.description = description;
        this.price = price;
        this.image = image;
    }

    public void Print(){
        System.out.println(this.articool.toString() + " " + this.description + " " + this.price.toString() + " " + this.image);
    }
}
