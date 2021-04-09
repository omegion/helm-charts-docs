<template>
  <section>
    <section class="container section">
      <portal to="hero">
        <section class="hero is-primary-dark is-overflow-hidden">
          <div class="hero-head">
            <Navbar shadow />
            <!--            <div class="container">-->
            <!--              <div class="section py-5">-->
            <!--                <breadcrumb :items="breadcrumbs" type="is-white" />-->
            <!--              </div>-->
            <!--            </div>-->
          </div>
          <div class="hero-body">
            <div class="container">
              <div class="columns">
                <div class="column is-8">
                  <div class="section pt-0 pb-3">
                    <p class="subtitle is-size-4">Install Helm Repo</p>
                    <HelmRepoInstall />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </portal>
      <div class="columns">
        <div class="column is-8">
          <ChartTable :charts="charts" />
        </div>
      </div>
    </section>
  </section>
</template>

<script lang="ts">
import { defineComponent, ref } from "@vue/composition-api";
import { useContext } from "@nuxtjs/composition-api";
import ChartTable from "~/components/ChartTable.vue";
import Hero from "~/components/Hero.vue";
import Breadcrumb from "~/components/Breadcrumbs.vue";
import Navbar from "~/components/Navbar.vue";
import HelmRepoInstall from "~/components/HelmRepoInstall.vue";

export default defineComponent({
  components: { HelmRepoInstall, Breadcrumb, Hero, ChartTable, Navbar },
  setup() {
    const { $config } = useContext();

    const charts = ref(null);
    const breadcrumbs = ref([
      {
        route: { name: "index" },
        name: "Blog"
      },
      {
        route: { name: "index" },
        name: "Blog"
      }
    ]);

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
      charts,
      breadcrumbs
    };
  }
});
</script>
