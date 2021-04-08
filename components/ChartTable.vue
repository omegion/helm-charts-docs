<template>
  <b-table :data="charts" :mobile-cards="false" class="chart-list">
    <b-table-column v-slot="props" field="name" label="Name">
      <ChartItem :item="props.row"></ChartItem>
    </b-table-column>
  </b-table>
</template>

<script lang="ts">
import { defineComponent } from "@vue/composition-api";
import ChartItem from "~/components/ChartItem.vue";

export default defineComponent({
  name: "ChartTable",
  components: { ChartItem },
  props: {
    charts: {
      type: Array,
      required: true
    }
  },
  setup() {}
});
</script>
