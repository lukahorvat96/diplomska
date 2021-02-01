<template>
  <v-container>
    <h1>DRINKS</h1>
    <product-list :products="allDrinks"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "Gin",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allGin"); //action; commit -> mutation
  },
  computed: {
    allDrinks() {
      return this.$store.getters.allGin;
    }
  }
};
</script>
