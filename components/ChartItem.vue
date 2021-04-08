<template>
  <nuxt-link
    tag="div"
    class="card"
    :to="{
      name: 'index'
    }"
  >
    <div class="card-content">
      <div class="media">
        <div class="media-content">
          <p class="title is-size-6 mb-2">
            {{ item.name }}
          </p>
          <p class="is-size-7 mb-2">
            {{ item.description }}
          </p>
          <nav class="level is-opacity-7 pb-0">
            <div class="level-left">
              <div class="level-item">
                <p class="is-size-7 is-flex">
                  <span class="has-text-weight-medium">App Version: </span>
                  <span class="has-text-weight-semibold ml-1">
                    {{ item.appVersion }}</span
                  >
                </p>
              </div>
              <div class="level-item">
                <p class="is-size-7 is-flex">
                  <span class="has-text-weight-medium">Chart Version: </span>
                  <span class="has-text-weight-semibold ml-1">
                    {{ item.version }}</span
                  >
                </p>
              </div>
            </div>
          </nav>
        </div>
      </div>
    </div>
  </nuxt-link>
</template>

<script lang="ts">
import { defineComponent } from "@vue/composition-api";

export default defineComponent({
  name: "ChartItem",
  props: {
    item: {
      type: Object,
      required: true
    }
  },
  setup() {}
});
</script>
