<template>
  <div>
    <v-card v-if="this.$store.state.isWaiter" elevation="10" tile>
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
    <v-card v-if="this.$store.state.isCooker" elevation="10" tile>
      <v-card-title class="headline" dark="1">
        {{ product.name }}
      </v-card-title>
      <v-card-text class="text--primary">
        <p>Price: {{ product.price }}$</p>
        <v-divider class="mx-4"></v-divider>
        <product-button :product="product"></product-button>
      </v-card-text>
    </v-card>
  </div>
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
