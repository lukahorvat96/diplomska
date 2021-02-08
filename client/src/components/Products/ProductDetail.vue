<template>
  <div v-if="isFood">
    <v-card elevation="10" tile>
      <v-img
        class="white--text align-end"
        height="200px"
        v-bind:src="'http://127.0.0.1/img/' + product.picture"
      >
      </v-img>
      <v-card-title class="headline" dark="1">
        {{ product.name }}
      </v-card-title>
      <v-card-text class="text--primary">
        <div class="my-4">Description: {{ product.description }}</div>

        <p class="text-h5 mb-6">{{ product.price }}$</p>
        <v-divider class="mx-4"></v-divider>
        <product-button :product="product"></product-button>
      </v-card-text>
    </v-card>
  </div>
  <div v-else>
    <v-card elevation="10" tile>
      <v-img
        class="white--text align-end"
        height="200px"
        v-bind:src="'http://127.0.0.1/img/' + product.picture"
        contain
      >
      </v-img>
      <v-card-title class="headline" dark="1">
        {{ product.name }}
      </v-card-title>
      <v-card-text class="text--primary">
        <div class="my-4">Description: {{ product.description }}</div>

        <p>Size: {{ product.size }}</p>
        <p class="text-h5 mb-6">{{ product.price }}$</p>
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
