<template>
  <v-card elevation="10" tile>
    <v-card-title class="headline" dark="1">
      {{ product.name }}
    </v-card-title>
    <v-card-text class="text--primary">
      <p>Size: {{ product.size }}</p>
      <p>Price: {{ product.price }}$</p>
      <v-divider class="mx-4"></v-divider>
      <product-button :product="product"></product-button>
    </v-card-text>
  </v-card>
</template>

<script>
import ProductButton from "@/components/Products/ProductButton";
export default {
  name: "ProductDetail",
  props: ["product"],
  components: {
    "product-button": ProductButton
  },
  data: () => ({
    show: false
  }),
  computed: {
    isFood() {
      console.log(this.product.type_id);
      if (this.product.type_id >= 15) return true;
      return false;
    }
  }
};
</script>

<style lang="scss" scoped>
.headline {
  color: black;
}
</style>
