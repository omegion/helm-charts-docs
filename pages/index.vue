<template>
  <section class="container section">
    <div class="columns">
      <div class="column is-8">
        <ChartTable :charts="charts" />
      </div>
    </div>
  </section>
</template>

<script lang="ts">
import { defineComponent, ref } from "@vue/composition-api";
import { useContext } from "@nuxtjs/composition-api";
import ChartTable from "~/components/ChartTable.vue";

export default defineComponent({
  components: { ChartTable },
  setup() {
    const { $config } = useContext();

    const charts = ref(null);

    const getCharts = () => {
      let yamlSource = "";
      if ($config.isProduction) {
        yamlSource = "index";
      } else {
        yamlSource = "test";
      }
      const res = require(`@/${yamlSource}.yaml`);
      // @ts-ignore
      const entries = Object.values(res.entries);
      // @ts-ignore
      charts.value = entries.map(x => x[0]);
    };

    getCharts();

    return {
      charts
    };
  }
});
</script>
