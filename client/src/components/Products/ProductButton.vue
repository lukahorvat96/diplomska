<template>
  <v-card-actions v-if="isNotInCart">
    <!--ITEM NOT IN CARD-->
    <h3>Count: 0x</h3>
    <v-spacer></v-spacer>
    <div>
      <v-btn elevation="2" color="green" tile @click="addToCart(product)"
        >ADD TO CART</v-btn
      >
    </div>
  </v-card-actions>

  <v-card-actions v-else>
    <!--ITEM ALREADY IN CARD -->
    <h3 v-if="setQuantity()">Count: {{ quantity }}x</h3>
    <v-spacer></v-spacer>
    <div>
      <v-btn elevation="2" tile @click="addToCart(product)">+</v-btn>
      <v-btn
        :disabled="disableMinus"
        elevation="2"
        tile
        @click="removeFromCart(product)"
        >-</v-btn
      >
      <v-btn
        :disabled="disableRemove"
        elevation="2"
        color="red"
        tile
        @click="removeFromCartAll(product)"
        >REMOVE</v-btn
      >
    </div>
  </v-card-actions>
</template>

<script>
import { ADD_TO_CART, DELETE_FROM_CART } from "@/store/mutation-types";
export default {
  name: "ProductButton",
  props: ["product"],
  data() {
    return {
      cart: this.$store.state.cart_product,
      quantity: 0,
      orderedQuantity: 0,
      orderedQuantity2: 0,
      index: -1,
      alreadyOrdered: false,
      disablePlus: false,
      disableMinus: false,
      disableRemove: false
    };
  },
  computed: {
    isNotInCart() {
      var cart = this.$store.getters.allCardProducts;
      const index2 = cart.findIndex(
        p => p.product_id === this.product.product_id
      );
      if (index2 < 0) return true;
      return false;
    }
  },
  methods: {
    addToCart(product) {
      var priceBefore = product.price * this.quantity;
      console.log("before: " + priceBefore);
      this.quantity = this.quantity + 1;
      var totalPrice = this.quantity * product.price;
      console.log("TotalPrice: " + totalPrice);
      this.disableMinus = false;
      if (this.quantity == 1) {
        this.$store.state.totalPrice += totalPrice;
        product.quantity = Number(this.quantity);
        product.totalPrice = Number(totalPrice);
        product.orderedQuantity = Number(this.orderedQuantity2);
        product.isOrdered = this.alreadyOrdered;
        this.$store.commit(ADD_TO_CART, product);
      } else {
        this.$store.state.totalPrice -= priceBefore;
        this.$store.state.totalPrice += totalPrice;
        console.log("After totalPriceState: " + this.$store.state.totalPrice);
        //this.$store.commit(DELETE_FROM_CART, product.product_id);
        product.quantity = Number(this.quantity);
        product.totalPrice = Number(totalPrice);
        product.orderedQuantity = Number(this.orderedQuantity2);
        product.isOrdered = this.alreadyOrdered;
        this.$store.commit(ADD_TO_CART, product);
      }
      console.log("POVEČANO: " + this.quantity);
      if (this.orderPlaced == true && this.orderedQuantity2 == this.quantity)
        this.disableMinus = true;
    },
    removeFromCart(product) {
      if (this.alreadyOrdered == true && this.orderedQuantity2 == this.quantity)
        this.disableMinus = true;
      else {
        var priceBefore = product.price * this.quantity;
        this.quantity = this.quantity - 1;
        var totalPrice = this.quantity * product.price;
        if (this.quantity != 0) {
          //this.$store.commit(DELETE_FROM_CART, product.product_id);
          product.quantity = Number(this.quantity);
          product.totalPrice = Number(totalPrice);
          product.orderedQuantity = Number(this.orderedQuantity2);
          product.isOrdered = this.alreadyOrdered;
          this.$store.commit(ADD_TO_CART, product);
        } else if (this.quantity == 0) {
          this.$store.commit(DELETE_FROM_CART, product.product_id);
        }
        this.$store.state.totalPrice -= priceBefore;
        this.$store.state.totalPrice += totalPrice;
      }
      if (this.alreadyOrdered == true && this.orderedQuantity2 == this.quantity)
        this.disableMinus = true;
    },
    setQuantity() {
      this.index = this.$store.state.cart_product.findIndex(
        p => p.product_id === this.product.product_id
      );
      if (this.index >= 0) {
        this.alreadyOrdered = this.cart[this.index].isOrdered;
        if (this.alreadyOrdered == true) {
          this.disableRemove = true;
        }
        this.quantity = this.cart[this.index].quantity;
        this.orderedQuantity2 = this.cart[this.index].orderedQuantity;
        console.log("QUAN: " + this.quantity);
        console.log("ORD QUAN: " + this.orderedQuantity2);
        if (
          this.alreadyOrdered == true &&
          this.orderedQuantity2 == this.quantity
        )
          this.disableMinus = true;
        return true;
      }
      return false;
    },
    removeFromCartAll(product) {
      this.$store.state.totalPrice -= this.product.price * this.product.quantity;
      this.$store.commit(DELETE_FROM_CART, product.product_id);
      this.quantity = 0;
    }
  }
};
</script>
<style>
@font-face {
  font-family: "Proxima";
  src: local("Proxima"), url(../../fonts/Proxima.ttf) format("truetype");
}
.proxima-font {
  font-family: "Proxima";
  margin-bottom: 5%;
  margin-top: 5%;
}
h3 {
  font-family: "Proxima";
  margin-bottom: 5%;
  margin-top: 5%;
}
</style>
