<template>
  <v-card>
    <!-- <v-img
      class="white--text align-end"
      height="200px"
      v-bind:src="'http://127.0.0.1/img/' + drink.picture"
    >
    </v-img> -->
    <v-card-title class="font-weight-bold"  dark="1"
      >{{ drink.quantity }}x {{ drink.name }}
    </v-card-title>
    <v-card-text class="text--primary">
      <p>Size: {{ drink.size }}</p>
      <p>Price: {{ drink.price }}$</p>
      <p>
        Total price: <span class="font-weight-medium">{{ drink.totalPrice }}€</span>
      </p>
    </v-card-text>
  </v-card>
</template>

<script>
import { ADD_TO_CART, DELETE_FROM_CART } from "@/store/mutation-types";
export default {
  name: "CartDetail",
  props: ["drink"],
  data() {
    return {
      cart: this.$store.state.cart_drink,
      quantity: 0
    };
  },
  computed: {
    isNotInCart() {
      const index = this.$store.state.cart_drink.findIndex(
        p => p.drink_id === this.drink.drink_id
      );
      if (index < 0) return true;
      return false;
    }
  },
  methods: {
    addToCart(drink) {
      this.quantity = this.quantity + 1;
      var totalPrice = this.quantity * this.drink.price;
      console.log("TOTAL PRICE: " + this.totalPrice);
      if (this.quantity == 1) {
        this.drink.quantity = Number(this.quantity);
        this.drink.totalPrice = Number(totalPrice);
        this.$store.commit(ADD_TO_CART, this.drink);
      } else {
        this.$store.commit(DELETE_FROM_CART, drink.drink_id);
        this.drink.quantity = Number(this.quantity);
        this.drink.totalPrice = Number(totalPrice);
        this.$store.commit(ADD_TO_CART, this.drink);
      }
    },
    removeFromCart(drink) {
      this.quantity = this.quantity - 1;
      var totalPrice = this.quantity * this.drink.price;
      if (this.quantity != 0) {
        this.$store.commit(DELETE_FROM_CART, drink.drink_id);
        this.drink.quantity = Number(this.quantity);
        this.drink.totalPrice = Number(totalPrice);
        this.$store.commit(ADD_TO_CART, this.drink);
      } else if (this.quantity == 0) {
        this.$store.commit(DELETE_FROM_CART, drink.drink_id);
      }
    },
    setQuantity() {
      const index = this.$store.state.cart_drink.findIndex(
        p => p.drink_id === this.drink.drink_id
      );
      if (index >= 0) {
        this.quantity = this.cart[index].quantity;
        return true;
      }
      return false;
    },
    removeFromCartAll(item) {
      this.$store.commit(DELETE_FROM_CART, item.drink_id);
    }
  }
};
</script>

<style lang="scss" scoped>
.headline {
  color: black;
}
</style>
