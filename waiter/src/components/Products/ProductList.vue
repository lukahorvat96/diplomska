<template>
  <v-container grid-list-xs>
    <v-row v-for="(row, i) in items" :key="i" row wrap>
      <v-col
        class="example"
        v-for="product in row"
        :key="product.id"
        :cols="cols"
      >
        <product-detail :product="product"></product-detail>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import ProductDetail from "@/components/Products/ProductDetail.vue";
export default {
  name: "ProductList",
  props: {
    products: {
      type: Array,
      required: true
    },
    colsNum: {
      type: Number,
      required: true
    }
  },
  computed: {
    items: function() {
      return this.products.reduce((acc, el, i) => {
        if (i % this.colsNum === 0) {
          acc.push([el]);
        } else {
          acc[acc.length - 1].push(el);
        }
        return acc;
      }, []);
    },
    cols: function() {
      return 12 / this.colsNum;
    }
  },
  components: {
    "product-detail": ProductDetail
  }
};
</script>

<style lang="scss" scoped>
.example {
  padding-right: 10px;
}
</style>
