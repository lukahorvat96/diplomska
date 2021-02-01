<template>
  <v-container>
    <h1>DRINKS</h1>
    <product-list :products="allDrinks"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "HotDrink",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allHotDrinks"); //action; commit -> mutation
  },
  computed: {
    allDrinks() {
      return this.$store.getters.allHotDrinks;
    }
  }
};
</script>
