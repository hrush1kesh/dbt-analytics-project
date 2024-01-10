{% macro discounted_price(price) %}
    {% set discount_rate = 0.10 %}
    {% set discounted_price = original_price * (
        1 - discount_rate
    ) %}
    {{ discounted_price }}
{% endmacro %}