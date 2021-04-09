<template>
  <nav class="level">
    <div class="level-left">
      <div class="level-item">
        <nav
            :class="['breadcrumb is-small has-arrow-separator', type]"
            aria-label="breadcrumbs"
        >
          <ul>
            <li
                v-for="(el, index) in items"
                :key="index"
                :class="{
                'is-active': index === items.length - 1 && disableLastItem,
              }"
            >
              <nuxt-link
                  tag="a"
                  :to="{ name: 'index' }"
                  :class="[
                  'has-text-weight-semibold is-size-7 is-capitalized',
                  textColor,
                ]"
              >
                {{ el.name }}
              </nuxt-link>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </nav>
</template>

<script lang="ts">
import {computed, defineComponent} from "@vue/composition-api";

export default defineComponent({
  name: "Breadcrumb",
  props: {
    items: {
      type: Array,
      required: true,
    },
    type: {
      type: String,
      default: "is-white",
    },
    disableLastItem: {
      type: Boolean,
      default: true,
    },
  },
  setup(props) {
    const textColor = computed(() => {
      if (props.type === "is-primary") {
        return "has-text-primary";
      }
      return "has-text-white";
    });

    return {textColor};
  },
});
</script>
