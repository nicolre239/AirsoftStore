package app.database;

public class CartItemModel {
    protected Integer idCartItem;
    protected Integer quantity;
    protected Integer articool;
    protected Integer price;
    protected Integer idUser;
    protected String info;
    protected String picture;

    public CartItemModel(Integer idCartItem, Integer quantity, Integer articool, Integer price, Integer idUser, String info, String picture) {
        this.idCartItem = idCartItem;
        this.quantity = quantity;
        this.articool = articool;
        this.price = price;
        this.idUser = idUser;
        this.info = info;
        this.picture = picture;
    }

    @Override
    public String toString() {
        return "CartItemModel{" +
                "idCartItem=" + idCartItem +
                ", quantity=" + quantity +
                ", articool=" + articool +
                ", price=" + price +
                ", idUser=" + idUser +
                ", info='" + info + '\'' +
                ", picture='" + picture + '\'' +
                '}';
    }

    public Integer getIdCartItem() {
        return idCartItem;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public Integer getArticool() {
        return articool;
    }

    public Integer getPrice() {
        return price;
    }

    public Integer getIdUser() {
        return idUser;
    }

    public String getInfo() {
        return info;
    }

    public String getPicture() {
        return picture;
    }
}
