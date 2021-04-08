// @ts-ignore
import moment from "moment";

import Vue from "vue";

Vue.filter("humanize", (value: string) => {
  if (value) {
    return moment(String(value)).fromNow();
  }
});

Vue.filter("trim", (text: string, max: number) => {
  if (text) {
    return text.substr(0, max - 1) + (text.length > max ? "..." : "");
  }
});

Vue.filter("formatDate", (value: string) => {
  if (value) {
    return moment(String(value)).format("Do MMMM YYYY");
  }
});

Vue.filter("formatDateMonth", (value: string) => {
  if (value) {
    return moment(String(value)).format("Do MMMM");
  }
});

Vue.filter("formatDateMonthYear", (value: string) => {
  if (value) {
    return moment(String(value)).format("MMMM YYYY");
  }
});

Vue.filter("formatDateTime", (value: string) => {
  if (value) {
    return moment(String(value)).format("DD MMM YYYY, hh:mm A");
  }
});

Vue.filter("readingTimeHumanize", (value: string) => {
  if (value) {
    const duration = moment.duration(value);
    return duration.humanize();
  }
});
