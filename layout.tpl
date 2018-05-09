<!doctype html>
<html lang="{$language_code}">
  <head>
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
  </head>

  <body id="{$page.page_name}" class="{$page.body_classes|classnames}">

    {block name='hook_after_body_opening_tag'}
      {hook h='displayAfterBodyOpeningTag'}
    {/block}

    <header id="header">
      {block name='header'}
        {include file='_partials/header.tpl'}
      {/block}
    </header>

    {block name='notifications'}
      {include file='_partials/notifications.tpl'}
    {/block}

    <div id="wrapper">
      {hook h="displayWrapperTop"}

      {block name='breadcrumb'}
        {include file='_partials/breadcrumb.tpl'}
      {/block}

      {block name='left_column'}
        <div id="left-column">
          {if $page.page_name == 'product'}
            {hook h='displayLeftColumnProduct'}
          {else}
            {hook h="displayLeftColumn"}
          {/if}
        </div>
      {/block}

      {block name='right_column'}
        <div id="right-column">
          {if $page.page_name == 'product'}
            {hook h='displayRightColumnProduct'}
          {else}
            {hook h="displayRightColumn"}
          {/if}
        </div>
      {/block}

      {block name='content_wrapper'}
        <div id="content-wrapper" class="left-column right-column">
          {hook h="displayContentWrapperTop"}
          {block name='content'}
            <p>Hello world! This is HTML5 Boilerplate.</p>
          {/block}
          {hook h="displayContentWrapperBottom"}
        </div>
      {/block}

      {hook h="displayWrapperBottom"}
    </div>

    <footer id="footer">
      {block name='footer'}
        {include file='_partials/footer.tpl'}
      {/block}
    </footer>

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}
{strip}
  {addJsDef isMobile=$mobile_device}
  {addJsDef baseDir=$content_dir}
  {addJsDef baseUri=$base_uri}
  {addJsDef static_token=$static_token}
  {addJsDef token=$token}
  {addJsDef priceDisplayPrecision=$priceDisplayPrecision*$currency->decimals}
  {addJsDef priceDisplayMethod=$priceDisplay}
  {addJsDef roundMode=$roundMode}
  {addJsDef currency=$currency}
  {addJsDef currencyRate=$currencyRate|floatval}
  {addJsDef currencySign=$currency->sign|html_entity_decode:2:"UTF-8"}
  {addJsDef currencyFormat=$currency->format|intval}
  {addJsDef currencyBlank=$currency->blank|intval}
  {addJsDef isLogged=$is_logged|intval}
  {addJsDef isGuest=$is_guest|intval}
  {addJsDef page_name=$page_name|escape:'html':'UTF-8'}
  {addJsDef contentOnly=$content_only|boolval}
  {if isset($cookie->id_lang)}
    {addJsDef id_lang=$cookie->id_lang|intval}
  {/if}
  {addJsDefL name=FancyboxI18nClose}{l s='Close'}{/addJsDefL}
  {addJsDefL name=FancyboxI18nNext}{l s='Next'}{/addJsDefL}
  {addJsDefL name=FancyboxI18nPrev}{l s='Previous'}{/addJsDefL}
  {addJsDef usingSecureMode=Tools::usingSecureMode()|boolval}
  {addJsDef ajaxsearch=Configuration::get('PS_SEARCH_AJAX')|boolval}
  {addJsDef instantsearch=Configuration::get('PS_INSTANT_SEARCH')|boolval}
  {addJsDef quickView=$quick_view|boolval}
  {addJsDef displayList=Configuration::get('PS_GRID_PRODUCT')|boolval}
  {addJsDef highDPI=Configuration::get('PS_HIGHT_DPI')|boolval}
{/strip}

  </body>

</html>