<template>
  <v-card-actions v-if="isNotInCart">
    <!--ITEM NOT IN CARD-->
    <p class="text-h6 mb-5 mt-5">Count: 0x</p>
    <v-spacer></v-spacer>
    <div>
      <v-btn elevation="2" color="green" tile @click="addToCart(drink)"
        >ADD TO CART</v-btn
      >
    </div>
  </v-card-actions>

  <v-card-actions v-else>
    <!--ITEM ALREADY IN CARD -->
    <p class="text-h6 mb-5 mt-5" v-if="setQuantity()">Count: {{ quantity }}x</p>
    <v-spacer></v-spacer>
    <div>
      <v-btn elevation="2" tile @click="addToCart(drink)">+</v-btn>
      <v-btn
        :disabled="disableMinus"
        elevation="2"
        tile
        @click="removeFromCart(drink)"
        >-</v-btn
      >
      <v-btn
        :disabled="disableRemove"
        elevation="2"
        color="red"
        tile
        @click="removeFromCartAll(drink)"
        >REMOVE</v-btn
      >
    </div>
  </v-card-actions>
</template>

<script>
import { ADD_TO_CART, DELETE_FROM_CART } from "@/store/mutation-types";
export default {
  name: "DrinkButton",
  props: ["drink"],
  data() {
    return {
      cart: this.$store.state.cart_drink,
      quantity: 0,
      orderedProduct: false,
      disablePlus: false,
      disableMinus: false,
      disableRemove: false,
      orderedQuantity: 0,
      orderPlaced: this.$store.state.orderPlaced,
      orderedCart: this.$store.state.orderedDrink,
      index: -1
    };
  },
  computed: {
    isNotInCart() {
      const ordered = this.$store.state.orderedDrink.findIndex(
        p => p.drink_id === this.drink.drink_id
      );
      if (ordered >= 0) {
        return false;
      } else {
        const index = this.$store.state.cart_drink.findIndex(
          p => p.drink_id === this.drink.drink_id
        );
        if (index < 0) return true;
        return false;
      }
    }
  },
  methods: {
    addToCart(drink) {
      this.quantity = this.quantity + 1;
      var totalPrice = this.quantity * this.drink.price;
      this.disableMinus = false;
      if (this.quantity == 1) {
        this.$store.state.totalPrice += totalPrice;
        this.drink.quantity = Number(this.quantity);
        this.drink.totalPrice = Number(totalPrice);
        this.$store.commit(ADD_TO_CART, this.drink);
      } else {
        this.$store.state.totalPrice -= this.drink.price * this.drink.quantity;
        this.$store.state.totalPrice += totalPrice;
        this.$store.commit(DELETE_FROM_CART, drink.drink_id);
        this.drink.quantity = Number(this.quantity);
        this.drink.totalPrice = Number(totalPrice);
        this.$store.commit(ADD_TO_CART, this.drink);
      }
      console.log("POVEČANO: " + this.quantity)
    },
    removeFromCart(drink) {
      console.log("QUAN IN CART: "+this.orderedCart[this.index].quantity)
      console.log("THIS QUAN: "+ this.quantity)
      if (
        this.orderPlaced == true &&
        this.orderedCart[this.index].quantity == this.quantity
      )
        this.disableMinus = true;
      else {
        this.quantity = this.quantity - 1;
        var totalPrice = this.quantity * this.drink.price;
        this.$store.state.totalPrice -= this.drink.price * this.drink.quantity;
        if (this.quantity != 0) {
          this.$store.commit(DELETE_FROM_CART, drink.drink_id);
          this.$store.state.totalPrice += totalPrice;
          this.drink.quantity = Number(this.quantity);
          this.drink.totalPrice = Number(totalPrice);
          this.$store.commit(ADD_TO_CART, this.drink);
        } else if (this.quantity == 0) {
          this.$store.commit(DELETE_FROM_CART, drink.drink_id);
        }
      }
    },
    setQuantity() {
      this.index = this.$store.state.cart_drink.findIndex(
        p => p.drink_id === this.drink.drink_id
      );
      if (this.index >= 0) {
        if (this.orderPlaced == true) {
          this.disableRemove = true;
        }
        this.quantity = this.cart[this.index].quantity;
        return true;
      }
      return false;
    },
    removeFromCartAll(drink) {
      this.$store.state.totalPrice -= this.drink.price * this.drink.quantity;
      this.$store.commit(DELETE_FROM_CART, drink.drink_id);
      this.quantity = 0;
    }
  }
};
</script>

<style></style>
