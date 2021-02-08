<template>
  <v-container>
    <h1>CIDER</h1>
    <v-divider />
    <product-list :products="allCider"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "Cider",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allCider"); //action; commit -> mutation
  },
  computed: {
    allCider() {
      return this.$store.getters.allCider;
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
