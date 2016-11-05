package no.itera.fagdag.java1.model;

/**
 * Created by annieaa on 23/01/15.
 */
public enum OrderStatus {

    Created("Created"), Submitted("Submitted"), Closed("Closed");

    private String name;

    private OrderStatus(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public static OrderStatus fromName(String name) {
        if (name.equals(OrderStatus.Created.getName())) {
            return OrderStatus.Created;
        }
        else if(name.equals(OrderStatus.Submitted.getName())) {
            return OrderStatus.Submitted;
        }
        else if(name.equals(OrderStatus.Closed.getName())) {
            return OrderStatus.Closed;
        }
        return null;
    }

}
