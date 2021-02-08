<template>
  <v-container grid-list-xs>
    <v-row v-for="(row, i) in items" :key="i" row wrap>
      <v-col
        class="example"
        v-for="product in row"
        :key="product.id"
        :cols="cols"
      >
        <product-detail class="proxima-font" :product="product"></product-detail>
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
  data() {
    return {
      colsNum: 2
    };
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
<style scoped>
@font-face {
  font-family: "Proxima";
  src: local("Proxima"), url(../../fonts/Proxima.ttf) format("truetype");
}
@font-face {
  font-family: "Proxima_nova";
  src: local("Proxima_nova"), url(../../fonts/Proxima_nova.ttf) format("truetype");
}
.proxima-font {
  font-family: "Proxima_nova";
}
</style>
