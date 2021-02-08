<template>
  <v-container>
    <h1>WINES</h1>
    <v-divider />
    <product-list :products="allBottledBeer"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "Wine",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allWine"); //action; commit -> mutation
  },
  computed: {
    allBottledBeer() {
      return this.$store.getters.allWine;
    }
  }
};
</script>
<style scoped>
h1 {
  margin-bottom: 2%;
  margin-left: 1%;
}
</style>
