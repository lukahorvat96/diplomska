<template>
  <v-container>
    <h1>DRINKS</h1>
    <product-list :products="allDrinks"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "Vodka",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allVodka"); //action; commit -> mutation
  },
  computed: {
    allDrinks() {
      return this.$store.getters.allVodka;
    }
  }
};
</script>
