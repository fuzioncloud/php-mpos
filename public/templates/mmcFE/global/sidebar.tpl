            <div class="block" style="clear:none; margin-top:15px; margin-left:13px;">
              <div class="block_head">
                <div class="bheadl"></div>
                <div class="bheadr"></div>
                <h1>Dashboard</h1>
              </div>
              <div class="block_content" style="padding-top:10px;">
                <table class="sidebar" style="width: 196px">
                    <tr>
                      <td colspan="2"><b><u>Your Stats</u></b></td>
                    </tr>
                    <tr>
                      <td><b>Hashrate</b></td>
                      <td class="right">{$GLOBAL.userdata.hashrate|number_format} KH/s</td>
                    </tr>
{if $GLOBAL.config.payout_system == 'pps'}
                    <tr>
                      <td><b>Share Rate</b></td>
                      <td class="right">{$GLOBAL.userdata.sharerate|number_format:"2"} S/s</td>
                    </tr>
                    <tr>
                      <td><b>PPS Value</b></td>
                      <td class="right">{$GLOBAL.ppsvalue}</td>
                    </tr>
                    <tr>
                      <td><b>{$GLOBAL.config.currency} in 24h</b></td>
                      <td class="right">{($GLOBAL.userdata.sharerate * 24 * 60 * 60 * $GLOBAL.ppsvalue)|number_format:"8"}</td>
                    </tr>
{/if}
{if $GLOBAL.config.payout_system != 'pps'}
                    <tr>
                      <td colspan="2"><b><u>Unpaid Shares</u></b> <span id='tt'><img src='{$PATH}/images/questionmark.png' height='15px' width='15px' title='Submitted shares between the last 120 confirms block until now.'></span></td>
                    </tr>
                    <tr>
                      <td><b>Your Valid<b></td>
                      <td class="right"><i>{$GLOBAL.userdata.shares.valid|number_format}</i><font size='1px'></font></b></td>
                    </tr>
                    <tr>
                      <td><b>Pool Valid</td>
                      <td class="right"><i>{$GLOBAL.roundshares.valid|number_format}</i> <font size='1px'></font></b></td>
                    </tr>
{/if}
                    <tr>
                      <td colspan="2"><b><u>Round Shares</u></b> <span id='tt'><img src='{$PATH}/images/questionmark.png' height='15px' width='15px' title='Submitted shares since last found block (ie. round shares)'></span></td>
                    </tr>
                    <tr>
                      <td><b>Pool Valid</b></td>
                      <td class="right"><i>{$GLOBAL.roundshares.valid|number_format}</i></td>
                    </tr>
                    <tr>
                      <td><b>Pool Invalid</b></td>
                      <td class="right"><i>{$GLOBAL.roundshares.invalid|number_format}</i></td>
                    </tr>
                    <tr>
                      <td><b>Your Invalid</b></td>
                      <td class="right"><i>{$GLOBAL.userdata.shares.invalid|number_format}</i><font size='1px'></font></td>
                    </tr>
{if $GLOBAL.config.payout_system != 'pps'}
                    <tr>
                      <td colspan="2"><b><u>{$GLOBAL.config.currency} Round Estimate</u></b></td>
                    </tr>
                    <tr>
                      <td><b>Block</b></td>
                      <td class="right">{$GLOBAL.userdata.est_block|number_format:"3"}</td>
                    </tr>
                    <tr>
                      <td><b>Fees</b></td>
                      <td class="right">{$GLOBAL.userdata.est_fee|number_format:"3"}</td>
                    </tr>
                    <tr>
                      <td><b>Donation</b></td>
                      <td class="right">{$GLOBAL.userdata.est_donation|number_format:"3"}</td>
                    </tr>
                    <tr>
                      <td><b>Payout</b></td>
                      <td class="right">{$GLOBAL.userdata.est_payout|number_format:"3"}</td>
                    </tr>
{/if}
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr><td colspan="2"><b><u>{$GLOBAL.config.currency} Account Balance</u></b></td></tr>
                    <tr><td>Confirmed</td><td class="right"><b>{$GLOBAL.userdata.balance.confirmed|default:"0"}</td></tr>
                    <tr><td>Unconfirmed</td><td class="right"><b>{$GLOBAL.userdata.balance.unconfirmed|default:"0"}</td></tr>
                  </table>
                </div>
              <div class="bendl"></div>
              <div class="bendr"></div>
            </div>
