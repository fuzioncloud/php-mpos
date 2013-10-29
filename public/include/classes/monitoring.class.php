<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
  die('Hacking attempt');

class Monitoring extends Base {
  public function __construct() {
    $this->table = 'monitoring';
  }

  public function storeUptimeRobotStatus() {
    if ($api_key = $this->setting->getValue('monitoring_uptimerobot_private_key')) {
      $url = 'http://api.uptimerobot.com';
      $target = '/getMonitors?apiKey=' . $api_key . '&format=json&noJsonCallback=1&customUptimeRatio=1&logs=1';
      if (!$json = json_encode($this->tools->getApi($url, $target))) {
        $this->setErrorMessage('Failed to run API call: ' . $this->tools->getError());
        return false;
      }
      if (!$this->setting->setValue('monitoring_uptimerobot_status', $json)) {
        $this->setErrorMessage('Failed to store uptime status: ' . $setting->getError());
      }
    }
    return true;
  }

  public function getUptimeRobotStatus() {
    if ($json = $this->setting->getValue('monitoring_uptimerobot_status'))
      return json_decode($json, true);
    return false;
  }

  /**
   * Fetch a value from our table
   * @param name string Setting name
   * @return value string Value
   **/
  public function getStatus($name) {
    $query = $this->mysqli->prepare("SELECT * FROM $this->table WHERE name = ? LIMIT 1");
    if ($query && $query->bind_param('s', $name) && $query->execute() && $result = $query->get_result()) {
      return $result->fetch_assoc();
    } else {
      $this->debug->append("Failed to fetch variable $name from $this->table");
      return false;
    }
    return $value;
  }

  /**
   * Insert or update a setting
   * @param name string Name of the variable
   * @param value string Variable value
   * @return bool
   **/
  public function setStatus($name, $type, $value) {
    $stmt = $this->mysqli->prepare("
      INSERT INTO $this->table (name, type, value)
      VALUES (?, ?, ?)
      ON DUPLICATE KEY UPDATE value = ?
      ");
    if ($stmt && $stmt->bind_param('ssss', $name, $type, $value, $value) && $stmt->execute())
      return true;
    $this->debug->append("Failed to set $name to $value");
    return false;
  }
}

$monitoring = new Monitoring();
$monitoring->setConfig($config);
$monitoring->setDebug($debug);
$monitoring->setMysql($mysqli);
$monitoring->setSetting($setting);
