<template>
  <v-container>
    <h1>PAD THAI</h1>
    <v-divider />
    <product-list :products="allFoods"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "PadThai",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allPadThai"); //action; commit -> mutation
  },
  computed: {
    allFoods() {
      return this.$store.getters.allPadThai;
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
