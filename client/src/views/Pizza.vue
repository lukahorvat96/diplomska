<template>
  <v-container>
    <h1>Foods</h1>
    <product-list :products="allFoods"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "Pizza",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allPizzas"); //action; commit -> mutation
  },
  computed: {
    allFoods() {
      return this.$store.getters.allPizzas;
    }
  }
};
</script>
