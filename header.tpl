<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>
      {if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} -
      {$companyname}
    </title>

    {include file="$template/includes/head.tpl"} {$headoutput}
  </head>
  <body data-phone-cc-input="{$phoneNumberInputStyle}" {if $loginpage or
  $templatefile eq "clientregister"}class="fullpage"{/if}> {if !$loginpage and
  $templatefile ne "clientregister"} {$headeroutput}
  <div
    id="header-holder"
    class="{if $templatefile != 'homepage'}no-bg-img{/if}"
  >
    {if $templatefile == 'homepage'}
    <div class="cloud-bg"></div>
    {/if}
    <section id="header">
      <div class="container container">
        <ul class="top-nav">
          {if $languagechangeenabled && count($locales) > 1}
          <li>
            <a
              href="#"
              class="choose-language"
              data-toggle="popover"
              id="languageChooser"
            >
              {$activeLocale.localisedName}
              <b class="caret"></b>
            </a>
            <div id="languageChooserContent" class="hidden">
              <ul>
                {foreach $locales as $locale}
                <li>
                  <a href="{$currentpagelinkback}language={$locale.language}"
                    >{$locale.localisedName}</a
                  >
                </li>
                {/foreach}
              </ul>
            </div>
          </li>
          {/if} {if $loggedin}
          <li>
            <a
              href="#"
              data-toggle="popover"
              id="accountNotifications"
              data-placement="bottom"
            >
              {$LANG.notifications} {if count($clientAlerts) > 0}
              <span class="label label-info"
                >{lang key='notificationsnew'}</span
              >
              {/if}
              <b class="caret"></b>
            </a>
            <div id="accountNotificationsContent" class="hidden">
              <ul class="client-alerts">
                {foreach $clientAlerts as $alert}
                <li>
                  <a href="{$alert->getLink()}">
                    <i
                      class="fas fa-fw fa-{if $alert->getSeverity() == 'danger'}exclamation-circle{elseif $alert->getSeverity() == 'warning'}exclamation-triangle{elseif $alert->getSeverity() == 'info'}info-circle{else}check-circle{/if}"
                    ></i>
                    <div class="message">{$alert->getMessage()}</div>
                  </a>
                </li>
                {foreachelse}
                <li class="none">{$LANG.notificationsnone}</li>
                {/foreach}
              </ul>
            </div>
          </li>
          <li class="primary-action">
            <a href="{$WEB_ROOT}/logout.php" class="btn">
              {$LANG.clientareanavlogout}
            </a>
          </li>
          {else}
          <li class="primary-action">
            <a href="{$WEB_ROOT}/cart.php?a=view" class="btn">
              {$LANG.viewcart}
            </a>
          </li>
          {/if} {if $adminMasqueradingAsClient || $adminLoggedIn}
          <li>
            <a
              href="{$WEB_ROOT}/logout.php?returntoadmin=1"
              class="btn btn-logged-in-admin"
              data-toggle="tooltip"
              data-placement="bottom"
              title="{if $adminMasqueradingAsClient}{$LANG.adminmasqueradingasclient} {$LANG.logoutandreturntoadminarea}{else}{$LANG.adminloggedin} {$LANG.returntoadminarea}{/if}"
            >
              <i class="fas fa-sign-out-alt"></i>
            </a>
          </li>
          {/if}
        </ul>
        {if $assetLogoPath}
        <a href="{$WEB_ROOT}/index.php" class="logo navbar-brand"
          ><img src="{$assetLogoPath}" alt="{$companyname}"
        /></a>
        {else}
        <a href="{$WEB_ROOT}/index.php" class="navbar-brand"
          ><img
            src="{{assetPath file='logo.svg'}|replace:'/svg/':'/images/'}"
            alt="{$companyname}"
        /></a>
        {/if}
      </div>
    </section>

    <section id="main-menu">
      <nav id="nav" class="navbar navbar-default navbar-main" role="navigation">
        <div class="container container">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <button
              type="button"
              class="navbar-toggle"
              data-toggle="collapse"
              data-target="#primary-nav"
            >
              <span class="sr-only">{lang key='toggleNav'}</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="primary-nav">
            <ul class="nav navbar-nav">
              {include file="$template/includes/navbar.tpl"
              navbar=$primaryNavbar}
            </ul>

            <ul class="nav navbar-nav navbar-right">
              {include file="$template/includes/navbar.tpl"
              navbar=$secondaryNavbar}
            </ul>
          </div>
          <!-- /.navbar-collapse -->
        </div>
      </nav>
    </section>
    {if $templatefile == 'homepage'}
    <div id="top-content" class="container-fluid">
      <div class="container container">
        <div class="row">
          <div class="col-sm-12">
            <div class="main-slider">
              <div class="slide">
                <div class="row rtl-row">
                  <div class="col-sm-5">
                    <div class="img-holder">
                      <img
                        src="{{assetPath file='slide-img1.png'}|replace:'/png/':'/images/'}"
                        alt=""
                      />
                    </div>
                  </div>
                  <div class="col-sm-7">
                    <div class="b-text" style="margin-bottom: 10px">
                      High-Performance VPS, RDP & Dedicated Servers.
                    </div>
                    <p class="m-text" style="margin-bottom: 20px">
                      Scalable hosting solutions for businesses and
                      professionals.
                    </p>
                    <div class="m-text">
                      Instant Setup · Global Locations · From only
                      <bold>€7.50/mo</bold>
                    </div>
                    <a href="#" class="hbtn hbtn-primary hbtn-lg"
                      >Explore Server Plans</a
                    >
                  </div>
                </div>
              </div>
              <div class="slide">
                <div class="row rtl-row">
                  <div class="col-sm-5">
                    <div class="img-holder">
                      <img
                        src="{{assetPath file='slide-img2.png'}|replace:'/png/':'/images/'}"
                        alt=""
                      />
                    </div>
                  </div>
                  <div class="col-sm-7">
                    <div class="b-text">
                      Create your first<br />website today.
                    </div>
                    <div class="m-text">
                      Starting at only <span class="bold">$2.38/mo*</span>
                    </div>
                    <a href="#" class="hbtn hbtn-primary hbtn-lg">Create now</a>
                  </div>
                </div>
              </div>
              <div class="slide">
                <div class="row rtl-row">
                  <div class="col-sm-5">
                    <div class="img-holder">
                      <img
                        src="{{assetPath file='slide-img3.png'}|replace:'/png/':'/images/'}"
                        alt=""
                      />
                    </div>
                  </div>
                  <div class="col-sm-7">
                    <div class="b-text">
                      Build your site<br />with page builder
                    </div>
                    <div class="m-text">
                      Starting at only <span class="bold">$2.38/mo*</span>
                    </div>
                    <a href="#" class="hbtn hbtn-primary hbtn-lg">Learn more</a>
                  </div>
                </div>
              </div>
              <div class="slide">
                <div class="row">
                  <div class="col-xs-12">
                    {if $registerdomainenabled || $transferdomainenabled}
                    <div class="main-domain-search-holder">
                      <div class="b-text">
                        Simple, affordable<br />Web Hosting
                      </div>
                      <form
                        method="post"
                        action="domainchecker.php"
                        id="frmDomainHomepage"
                      >
                        <input type="hidden" name="transfer" />
                        <div class="row">
                          <div class="col-md-12">
                            <div class="input-items">
                              <input
                                type="text"
                                class="form-control domain-input"
                                name="domain"
                                placeholder="{$LANG.exampledomain}"
                                autocapitalize="none"
                                data-toggle="tooltip"
                                data-placement="left"
                                data-trigger="manual"
                                title="{lang key='orderForm.required'}"
                              />
                              <span class="input-items-btn">
                                {if $registerdomainenabled}
                                <input
                                  type="submit"
                                  class="btn search{$captcha->getButtonClass($captchaForm)}"
                                  value="{$LANG.search}"
                                  id="btnDomainSearch"
                                />
                                {/if} {if $transferdomainenabled}
                                <input
                                  type="submit"
                                  id="btnTransfer"
                                  class="btn transfer{$captcha->getButtonClass($captchaForm)}"
                                  value="{$LANG.domainstransfer}"
                                />
                                {/if}
                              </span>
                            </div>
                          </div>
                        </div>
                        {include file="$template/includes/captcha.tpl"}
                      </form>
                    </div>
                    {else}
                    <h2>{$LANG.doToday}</h2>
                    {/if}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    {/if}
  </div>
  {if $templatefile == 'homepage'}
  <div class="features container-fluid">
    <div class="container">
      <div class="row rtl-row">
        <div class="col-sm-5">
          <div class="img-holder">
            <img
              src="{{assetPath file='feature1.png'}|replace:'/png/':'/images/'}"
              alt=""
            />
          </div>
        </div>
        <div class="col-sm-7">
          <div class="feature-info">
            <div class="feature-title">Fast & Secure VPS and RDP Hosting</div>
            <div class="feature-text">
              Instantly deploy your virtual private server for business,
              browsing, or remote work. High-speed, full-access hosting.
            </div>
            <div class="feature-link">
              <a href="#" class="hbtn hbtn-default">View VPS & RDP Plans</a>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-5">
          <div class="img-holder">
            <img
              src="{{assetPath file='feature2.png'}|replace:'/png/':'/images/'}"
              alt=""
            />
          </div>
        </div>
        <div class="col-sm-7 def-aligned">
          <div class="feature-info">
            <div class="feature-title">Powerful Dedicated Servers</div>
            <div class="feature-text">
              Need maximum control and performance? Our dedicated servers are
              ready instantly perfect for heavy duty tasks or resellers.
            </div>
            <div class="feature-link">
              <a href="#" class="hbtn hbtn-default"
                >Explore Dedicated Servers</a
              >
            </div>
          </div>
        </div>
      </div>
      <div class="row rtl-row">
        <div class="col-sm-5">
          <div class="img-holder">
            <img
              src="{{assetPath file='feature3.png'}|replace:'/png/':'/images/'}"
              alt=""
            />
          </div>
        </div>
        <div class="col-sm-7">
          <div class="feature-info">
            <div class="feature-title">Scale Your Hosting With Confidence</div>
            <div class="feature-text">
              Whether you're launching your first project or expanding fast, our
              infrastructure grows with you hassle free.
            </div>
            <div class="feature-link">
              <a href="#" class="hbtn hbtn-default">Get Started!</a>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-5">
          <div class="img-holder">
            <img
              src="{{assetPath file='feature2.png'}|replace:'/png/':'/images/'}"
              alt=""
            />
          </div>
        </div>
        <div class="col-sm-7 def-aligned">
          <div class="feature-info">
            <div class="feature-title">Web Hosting & Domains</div>
            <div class="feature-text">
              We're expanding! Soon, you'll be able to host websites and
              register domains all in one place.
            </div>
            <div class="feature-link">
              <a href="#" class="hbtn hbtn-default">Stay Updated</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="latest-news container-fluid">
    <div class="container">
      <div class="row">
        <div class="col-sm-8">
          <div class="row-title">Latest news</div>
        </div>
        <div class="col-sm-4">
          <div class="main-btn-holder">
            <a
              href="{$WEB_ROOT}/index.php?rp=/announcements"
              class="hbtn hbtn-default"
              >View more</a
            >
          </div>
        </div>
      </div>
      <div class="row">
        {foreach from=$announcements item=announcement} {if $announcement@index
        < 3} {assign var="counter" value=$announcement@iteration} {if
        $counter>3} {assign var=counter value=1} {/if} {if $counter==1} {assign
        var=bgColor value="blue-bg"} {elseif $counter==2} {assign var=bgColor
        value="grey-bg"} {elseif $counter==3} {assign var=bgColor
        value="yellow-bg"} {/if}
        <div class="col-md-4">
          <div class="post-box {$bgColor}">
            <div class="post-img" style=""></div>
            <span class="badge badge-danger">New</span>
            <div class="post-title">{$announcement.title}</div>
            <div class="post-link">
              <a
                href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}"
                >Learn more</a
              >
            </div>
          </div>
        </div>
        {/if} {foreachelse} {include file="$template/includes/alert.tpl"
        type="info" msg="{$LANG.noannouncements}" textcenter=true} {/foreach}
      </div>
    </div>
  </div>
  {/if} {include file="$template/includes/validateuser.tpl"} {include
  file="$template/includes/verifyemail.tpl"}

  <section id="main-body">
    <div
      class="container{if $skipMainBodyContainer}-fluid without-padding{/if}"
    >
      <div class="row">
        {if !$inShoppingCart && ($primarySidebar->hasChildren() ||
        $secondarySidebar->hasChildren())} {if $primarySidebar->hasChildren() &&
        !$skipMainBodyContainer}
        <div class="col-md-9 pull-md-right">
          {include file="$template/includes/pageheader.tpl" title=$displayTitle
          desc=$tagline showbreadcrumb=true}
        </div>
        {/if}
        <div class="col-md-3 pull-md-left sidebar">
          {include file="$template/includes/sidebar.tpl"
          sidebar=$primarySidebar}
        </div>
        {/if}
        <!-- Container for main page display content -->
        <div
          class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-md-9 pull-md-right{else}col-xs-12{/if} main-content"
        >
          {if !$primarySidebar->hasChildren() && !$showingLoginPage &&
          !$inShoppingCart && $templatefile != 'homepage' &&
          !$skipMainBodyContainer} {include
          file="$template/includes/pageheader.tpl" title=$displayTitle
          desc=$tagline showbreadcrumb=true} {/if} {/if}
        </div>
      </div>
    </div>
  </section>
</html>
