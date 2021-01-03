<template>
  <v-card>
    <h1>Order ID: {{ orderID }}</h1>
    <v-card-text>
      <drink-list :items="allOrdersDrinkById"></drink-list>
      <v-btn elevation="2" color="red" tile>
        END ORDER
      </v-btn>
    </v-card-text>
  </v-card>
</template>

<script>
import DrinkList from "@/components/Cart/CartList.vue";
export default {
  name: "OrderDetailById",
  props: {
    orderID: {
      type: Number,
      required: true
    }
  },
  components: {
    "drink-list": DrinkList
  },
  created() {
    this.$store.dispatch("allOrdersDrinkById", this.orderID); //action; commit -> mutation
  },
  computed: {
    allOrdersDrinkById() {
      return this.$store.getters.allOrdersDrinkById;
    }
  }
};
</script>

<style lang="scss" scoped>
.headline {
  color: black;
}
</style>
