<template>
  <v-card>
    <v-img
      class="white--text align-end"
      height="200px"
      v-bind:src="'http://127.0.0.1/img/' + drink.picture"
    >
    </v-img>
    <v-card-title class="headline" dark="1"> {{ drink.name }} </v-card-title>
    <v-card-text class="text--primary">
      <v-row align="center" class="mx-0">
        <v-rating
          :value="4.5"
          color="amber"
          dense
          half-increments
          readonly
          size="14"
        ></v-rating>

        <div class="grey--text ml-4">
          4.5 (413)
        </div>
      </v-row>

      <div class="my-4">
        Small plates, salads & sandwiches - an intimate setting with 12 indoor
        seats plus patio seating. ###OPIS
      </div>

      <p>Size: {{ drink.size }}</p>
      <p>Price: {{ drink.price }}$</p>
      <p>
        Quantity: <span class="font-weight-medium">{{ quantity }}x</span>
      </p>

      <v-divider class="mx-4"></v-divider>
      <v-card-actions>
        <p class="text-h6 mb-5 mt-5" v-if="setQuantity()">
          Total price: {{ drink.totalPrice }}$
        </p>
        <v-spacer></v-spacer>
        <div v-if="itemInCard()">
          <v-btn elevation="2" tile @click="addToCart(drink)">+</v-btn>
          <v-btn elevation="2" tile @click="removeFromCart(drink)">-</v-btn>
          <v-btn
            elevation="2"
            color="red"
            tile
            @click="removeFromCartAll(drink)"
            >REMOVE</v-btn
          >
        </div>
      </v-card-actions>
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
      if (this.quantity == 1) {
        this.$store.state.totalPrice += totalPrice;
        this.drink.quantity = Number(this.quantity);
        this.drink.totalPrice = Number(totalPrice);
        this.$store.commit(ADD_TO_CART, this.drink);
      } else {
        this.$store.commit(DELETE_FROM_CART, drink.drink_id);
        this.$store.state.totalPrice += totalPrice;
        this.drink.quantity = Number(this.quantity);
        this.drink.totalPrice = Number(totalPrice);
        this.$store.commit(ADD_TO_CART, this.drink);
      }
    },
    removeFromCart(drink) {
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
      this.$store.state.totalPrice -= this.drink.price * this.drink.quantity;
      this.$store.commit(DELETE_FROM_CART, item.drink_id);
      this.quantity = 0;
    }
  }
};
</script>

<style lang="scss" scoped>
.headline {
  color: black;
}
</style>
