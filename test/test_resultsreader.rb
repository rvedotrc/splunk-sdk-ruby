require_relative 'test_helper'
require 'splunk-sdk-ruby'

class TestResultsReader < Test::Unit::TestCase
  def test_50_results
    file = File.open("test/data/results/5.0.2/results.xml")
    reader = Splunk::ResultsReader.new(file)
    assert_false(reader.is_preview?)

    expected_fields = ["_bkt", "_cd", "_indextime", "_kv", "_raw", "_serial",
                       "_si", "_sourcetype", "_subsecond", "_time",
                       "abandoned_channels", "active_hist_searches",
                       "active_realtime_searches", "average_kbps", "avg_age",
                       "bytes", "chillOrFreeze", "clientip", "component",
                       "cookie", "current_size", "current_size_kb", "date_hour",
                       "date_mday", "date_minute", "date_month", "date_second",
                       "date_wday", "date_year", "date_zone", "drop_count",
                       "eps", "ev", "eventtype", "file", "flushBlockSig",
                       "fork_recovermetadata", "group", "host", "ident",
                       "inactive_channels", "index", "instantaneous_eps",
                       "instantaneous_kbps", "kb", "kbps", "largest_size",
                       "linecount", "load_average", "log_level", "max_age",
                       "max_size_kb", "message", "method", "name",
                       "namespace", "new_channels", "numMsgs", "other",
                       "punct", "qsize", "qwork_units", "rebuild_metadata",
                       "reclaimed_channels", "referer", "referer_domain",
                       "removed_channels", "replicate_semislice",
                       "req_time", "retryMove_1hotBkt", "roll_hotBkt",
                       "root", "series", "service_externProc",
                       "service_maxSizes", "service_volumes", "sid",
                       "size_hotBkt", "smallest_size", "source",
                       "sourcetype", "spent", "splunk_server", "status",
                       "sync_hotBkt", "task", "throttle_optimize",
                       "timedout_channels", "timeendpos", "timestartpos",
                       "total_k_processed", "update_bktManifest",
                       "update_checksums", "uri", "uri_domain", "uri_path",
                       "uri_query", "user", "useragent", "version",
                       "workers"]
    assert_equal(expected_fields, reader.fields)

    expected_results = [
        {
            '_bkt' => '_internal~21~D8F318D9-5D7F-43B5-911F-9821FBAEEA9B',
            '_cd' => '21:59296',
            '_indextime' => '1355946377',
            '_kv' => '1',
            '_raw' => '127.0.0.1 - admin [19/Dec/2012:11:46:15.549 -0800] ' +
                '"GET /services/messages HTTP/1.1" 200 1984 - - - 1ms',
            '_serial' => '0',
            '_si' => ['fross-mbp15.local', '_internal'],
            '_sourcetype' => 'splunkd_access',
            '_subsecond' => '.549',
            '_time' => '2012-12-19T11:46:15.549-08:00',
            'bytes' => '1984',
            'clientip' => '127.0.0.1',
            'date_hour' => '11',
            'date_mday' => '19',
            'date_minute' => '46',
            'date_month' => 'december',
            'date_second' => '15',
            'date_wday' => 'wednesday',
            'date_year' => '2012',
            'date_zone' => '-480',
            'eventtype' => 'splunkd-access',
            'file' => 'messages',
            'host' => 'fross-mbp15.local',
            'ident' => '-',
            'index' => '_internal',
            'linecount' => '1',
            'method' => 'GET',
            'other' => '- - - 1ms',
            'punct' => '..._-__[//:::._-]_"_//_/."___-_-_-_',
            'req_time' => '19/Dec/2012:11:46:15.549 -0800',
            'root' => 'services',
            'source' => '/Users/fross/splunks/splunk-5.0.2/var/log/splunk/splunkd_access.log',
            'sourcetype' => 'splunkd_access',
            'spent' => '1',
            'splunk_server' => 'fross-mbp15.local',
            'status' => '200',
            'timeendpos' => '49',
            'timestartpos' => '19',
            'uri' => '/services/messages',
            'uri_path' => '/services/messages',
            'user' => 'admin',
            'version' => 'HTTP/1.1',
        },
        {
            '_bkt' => '_internal~21~D8F318D9-5D7F-43B5-911F-9821FBAEEA9B',
            '_cd' => '21:59301',
            '_indextime' => '1355946377',
            '_kv' => '1',
            '_raw' => '127.0.0.1 - admin [19/Dec/2012:11:46:15.544 -0800] "GET /en-US/api/messages/index HTTP/1.1" 200 341 "http://localhost:8000/en-US/search/inspector?sid=1355946305.42&namespace=search" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:17.0) Gecko/20100101 Firefox/17.0" - 50d219878b6ae2790 7ms',
            '_serial' => '1',
            '_si' => ['fross-mbp15.local', '_internal'],
            '_sourcetype' => 'splunk_web_access',
            '_subsecond' => '.544',
            '_time' => '2012-12-19T11:46:15.544-08:00',
            'bytes' => '341',
            'clientip' => '127.0.0.1',
            'date_hour' => '11',
            'date_mday' => '19',
            'date_minute' => '46',
            'date_month' => 'december',
            'date_second' => '15',
            'date_wday' => 'wednesday',
            'date_year' => '2012',
            'date_zone' => '-480',
            'file' => 'index',
            'host' => 'fross-mbp15.local',
            'ident' => '-',
            'index' => '_internal',
            'linecount' => '1',
            'method' => 'GET',
            'namespace' => 'search',
            'other' => '- 50d219878b6ae2790 7ms',
            'punct' => '..._-__[//:::._-]_"_/-///_/."___"://:/-//?=.&="_"/',
            'referer' => 'http://localhost:8000/en-US/search/inspector?sid=1355946305.42&namespace=search',
            'referer_domain' => 'http://localhost:8000',
            'req_time' => '19/Dec/2012:11:46:15.544 -0800',
            'root' => 'en-US',
            'sid' => '1355946305.42',
            'source' => '/Users/fross/splunks/splunk-5.0.2/var/log/splunk/web_access.log',
            'sourcetype' => 'splunk_web_access',
            'spent' => '7',
            'splunk_server' => 'fross-mbp15.local',
            'status' => '200',
            'timeendpos' => '49',
            'timestartpos' => '19',
            'uri' => '/en-US/api/messages/index',
            'uri_path' => '/en-US/api/messages/index',
            'user' => 'admin',
            'useragent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:17.0) Gecko/20100101 Firefox/17.0',
            'version' => 'HTTP/1.1',
        },
        {
            '_bkt' => '_internal~21~D8F318D9-5D7F-43B5-911F-9821FBAEEA9B',
            '_cd' => '21:59281',
            '_indextime' => '1355946374',
            '_kv' => '1',
            '_raw' => '127.0.0.1 - admin [19/Dec/2012:11:46:14.260 -0800] "GET /services/messages HTTP/1.1" 200 1984 - - - 1ms',
            '_serial' => '2',
            '_si' => ['fross-mbp15.local', '_internal'],
            '_sourcetype' => 'splunkd_access',
            '_subsecond' => '.260',
            '_time' => '2012-12-19T11:46:14.260-08:00',
            'bytes' => '1984',
            'clientip' => '127.0.0.1',
            'date_hour' => '11',
            'date_mday' => '19',
            'date_minute' => '46',
            'date_month' => 'december',
            'date_second' => '14',
            'date_wday' => 'wednesday',
            'date_year' => '2012',
            'date_zone' => '-480',
            'eventtype' => 'splunkd-access',
            'file' => 'messages',
            'host' => 'fross-mbp15.local',
            'ident' => '-',
            'index' => '_internal',
            'linecount' => '1',
            'method' => 'GET',
            'other' => '- - - 1ms',
            'punct' => '..._-__[//:::._-]_"_//_/."___-_-_-_',
            'req_time' => '19/Dec/2012:11:46:14.260 -0800',
            'root' => 'services',
            'source' => '/Users/fross/splunks/splunk-5.0.2/var/log/splunk/splunkd_access.log',
            'sourcetype' => 'splunkd_access',
            'spent' => '1',
            'splunk_server' => 'fross-mbp15.local',
            'status' => '200',
            'timeendpos' => '49',
            'timestartpos' => '19',
            'uri' => '/services/messages',
            'uri_path' => '/services/messages',
            'user' => 'admin',
            'version' => 'HTTP/1.1',
        }
    ]

    n_results = 0
    reader.each_with_index do |result, index|
      n_results += 1
      assert_equal(expected_results[index], result)
    end
    assert_equal(3, n_results)
  end

  def test_50_results_preview
    file = File.open("test/data/results/5.0.2/results-preview.xml")
    reader = Splunk::ResultsReader.new(file)
    assert_true(reader.is_preview?)

    expected_fields = ['_bkt', '_cd', '_confstr', '_indextime', '_kv', '_raw',
                       '_serial', '_si', '_sourcetype', '_subsecond', '_time',
                       'abandoned_channels', 'active_hist_searches',
                       'active_realtime_searches', 'app', 'appCodeName',
                       'appName', 'appVersion', 'average_kbps', 'avg_age',
                       'browser', 'bytes', 'chillOrFreeze', 'class',
                       'client_app', 'clientip', 'component', 'count',
                       'current_size', 'current_size_kb', 'date_hour',
                       'date_mday', 'date_minute', 'date_month', 'date_second',
                       'date_wday', 'date_year', 'date_zone', 'delimiter',
                       'digest', 'dispatched', 'display_row_numbers',
                       'drop_count', 'earliest', 'enable_event_actions',
                       'enable_field_actions', 'entity_name', 'eps', 'ev',
                       'eventtype', 'field_list', 'fields', 'file',
                       'fillcontents', 'flushBlockSig', 'fork_recovermetadata',
                       'group', 'host', 'ident', 'inactive_channels', 'index',
                       'instantaneous_eps', 'instantaneous_kbps', 'jobStatus',
                       'kb', 'kbps', 'largest_size', 'latest', 'line',
                       'linecount', 'load_average', 'log_level', 'max_age',
                       'max_lines', 'max_lines_constraint', 'max_size_kb',
                       'message', 'message_level', 'method', 'min_freq',
                       'min_lines', 'name', 'namespace', 'new_channels',
                       'numMsgs', 'offset', 'other', 'output_mode',
                       'output_time_format', 'platform', 'punct', 'q',
                       'qsize', 'qwork_units', 'rebuild_metadata',
                       'reclaimed_channels', 'referer', 'referer_domain',
                       'refresh', 'removed_channels', 'replicate_semislice',
                       'req_time', 'requestid', 'retryMove_1hotBkt',
                       'reverse_order', 'roll_hotBkt', 'root', 's', 'search',
                       'segmentation', 'series', 'service_externProc',
                       'service_maxSizes', 'service_volumes',
                       'show_empty_fields', 'sid', 'size_hotBkt',
                       'skipped', 'smallest_size', 'sortDir', 'sortKey',
                       'sort_dir', 'sort_key', 'source', 'sourcetype', 'spent',
                       'splunk_server', 'staticFields', 'status', 'sync_hotBkt',
                       'task', 'templateTime', 'throttle_optimize',
                       'time_format', 'timedout_channels', 'timeendpos',
                       'timestamp', 'timestartpos', 'total_k_processed',
                       'truncation_mode', 'update_bktManifest',
                       'update_checksums', 'uri', 'uri_path', 'uri_query',
                       'user', 'userAgent', 'useragent', 'version', 'viewTime',
                       'wait', 'with_new', 'workers']
    assert_equal(expected_fields, reader.fields)

    expected_results = [
        {
            '_bkt' => "_internal~20~D8F318D9-5D7F-43B5-911F-9821FBAEEA9B",
            '_cd' => "20:6362329",
            '_indextime' => "1355942859",
            '_kv' => "1",
            '_raw' => "12-19-2012 10:47:39.098 -0800 INFO  Metrics - group=mpool, max_used_interval=11760, max_used=106926, avg_rsv=256, capacity=536870912, used=0, rep_used=0",
            '_serial' => "20446",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunkd",
            '_subsecond' => ".098",
            '_time' => "2012-12-19T10:47:39.098-08:00",
            'component' => "Metrics",
            'date_hour' => "10",
            'date_mday' => "19",
            'date_minute' => "47",
            'date_month' => "december",
            'date_second' => "39",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "-480",
            'group' => "mpool",
            'host' => "fross-mbp15.local",
            'index' => "_internal",
            'linecount' => "1",
            'log_level' => "INFO",
            'message' => "group=mpool, max_used_interval=11760, max_used=106926, avg_rsv=256, capacity=536870912, used=0, rep_used=0",
            'punct' => "--_::._-____-_=,_=,_=,_=,_=,_=,_=",
            'source' => "/Users/fross/splunks/splunk-5.0.2/var/log/splunk/metrics.log",
            'sourcetype' => "splunkd",
            'splunk_server' => "fross-mbp15.local",
            'timeendpos' => "29",
            'timestartpos' => "0",
        },
        {
            '_bkt' => "_internal~20~D8F318D9-5D7F-43B5-911F-9821FBAEEA9B",
            '_cd' => "20:6362402",
            '_indextime' => "1355942859",
            '_kv' => "1",
            '_raw' => "12-19-2012 10:47:39.099 -0800 INFO  Metrics - group=pipeline, name=merging, processor=sendout, cpu_seconds=0.000000, executes=48, cumulative_hits=927340",
            '_serial' => "20436",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunkd",
            '_subsecond' => ".099",
            '_time' => "2012-12-19T10:47:39.099-08:00",
            'component' => "Metrics",
            'date_hour' => "10",
            'date_mday' => "19",
            'date_minute' => "47",
            'date_month' => "december",
            'date_second' => "39",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "-480",
            'group' => "pipeline",
            'host' => "fross-mbp15.local",
            'index' => "_internal",
            'linecount' => "1",
            'log_level' => "INFO",
            'message' => "group=pipeline, name=merging, processor=sendout, cpu_seconds=0.000000, executes=48, cumulative_hits=927340",
            'name' => "merging",
            'punct' => "--_::._-____-_=,_=,_=,_=.,_=,_=",
            'source' => "/Users/fross/splunks/splunk-5.0.2/var/log/splunk/metrics.log",
            'sourcetype' => "splunkd",
            'splunk_server' => "fross-mbp15.local",
            'timeendpos' => "29",
            'timestartpos' => "0"
        },
        {
            '_bkt' => "_internal~20~D8F318D9-5D7F-43B5-911F-9821FBAEEA9B",
            '_cd' => "20:6362395",
            '_indextime' => "1355942859",
            '_kv' => "1",
            '_raw' => '12-19-2012 10:47:39.099 -0800 INFO  Metrics - group=pipeline, name=merging, processor=readerin, cpu_seconds=0.000000, executes=48, cumulative_hits=927707',
            '_serial' => "20437",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunkd",
            '_subsecond' => ".099",
            '_time' => "2012-12-19T10:47:39.099-08:00",
            'component' => "Metrics",
            'date_hour' => "10",
            'date_mday' => "19",
            'date_minute' => "47",
            'date_month' => "december",
            'date_second' => "39",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "-480",
            'group' => "pipeline",
            'host' => "fross-mbp15.local",
            'index' => "_internal",
            'linecount' => "1",
            'log_level' => "INFO",
            'message' => "group=pipeline, name=merging, processor=readerin, cpu_seconds=0.000000, executes=48, cumulative_hits=927707",
            'name' => "merging",
            'punct' => "--_::._-____-_=,_=,_=,_=.,_=,_=",
            'source' => "/Users/fross/splunks/splunk-5.0.2/var/log/splunk/metrics.log",
            'sourcetype' => "splunkd",
            'splunk_server' => "fross-mbp15.local",
            'timeendpos' => "29",
            'timestartpos' => "0"
        }
    ]

    n_results = 0
    reader.each_with_index do |result, index|
      n_results += 1
      assert_equal(expected_results[index], result)
    end

    assert_equal(3, n_results)
  end

  def test_50_results_empty_preview
    file = File.open("test/data/results/5.0.2/results-empty_preview.xml")
    reader = Splunk::ResultsReader.new(file)
    assert_true(reader.is_preview?)
    assert_equal([], reader.fields)
    n_events = 0
    reader.each do |result|
      n_events += 1
    end
    assert_equal(0, n_events)
  end

  def test_50_results_empty
    file = File.open("test/data/results/5.0.2/results-empty.xml")
    reader = Splunk::ResultsReader.new(file)
    assert_false(reader.is_preview?)
    assert_equal([], reader.fields)
    n_events = 0
    reader.each do |result|
      n_events += 1
    end
    assert_equal(0, n_events)
  end

  def test_43_results
    file = File.open("test/data/results/4.3.5/results.xml")
    reader = Splunk::ResultsReader.new(file)
    assert_false(reader.is_preview?)

    expected_fields = ['_cd', '_indextime', '_kv', '_raw', '_serial', '_si',
                       '_sourcetype', '_subsecond', '_time', 'bytes',
                       'client_app', 'clientip', 'cookie', 'count', 'date_hour',
                       'date_mday', 'date_minute', 'date_month', 'date_second',
                       'date_wday', 'date_year', 'date_zone',
                       'display_row_numbers', 'earliest',
                       'enable_event_actions', 'enable_field_actions',
                       'entity_name', 'eventtype', 'field_list', 'file',
                       'fillcontents', 'host', 'ident', 'index', 'latest',
                       'linecount', 'max_lines', 'max_lines_constraint',
                       'method', 'min_freq', 'min_lines', 'offset', 'other',
                       'output_mode', 'output_time_format', 'punct', 'q',
                       'referer', 'referer_domain', 'req_time', 'reverse_order',
                       'root', 's', 'segmentation', 'show_empty_fields', 'sid',
                       'source', 'sourcetype', 'spent', 'splunk_server',
                       'status', 'time_format', 'timeendpos', 'timestartpos',
                       'truncation_mode', 'uri', 'uri_domain', 'uri_path',
                       'uri_query', 'user', 'useragent', 'version']
    assert_equal(expected_fields, reader.fields)

    expected_results = [
        {
            '_cd' => "54:23786",
            '_indextime' => "1355946940",
            '_kv' => "1",
            '_raw' => "127.0.0.1 - admin [19/Dec/2012:11:55:39.296 -0800] " +
                "\"POST /en-US/api/shelper HTTP/1.1\" 200 1398 \"http://" +
                "localhost:8000/en-US/app/<sg h=\"1\">search</sg>/" +
                "flashtimeline?q=<sg h=\"1\">search</sg>%20<sg h=\"1\">search" +
                "</sg>%20index%3D_internal%20%7C%20head%2010&earliest=rt-1h" +
                "&latest=rt\" \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;" +
                " rv:17.0) Gecko/20100101 Firefox/17.0\" - 50d21bbb4b5224c10" +
                " 3ms",
            '_serial' => "0",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunk_web_access",
            '_subsecond' => ".296",
            '_time' => "2012-12-19T11:55:39.296-08:00",
            'bytes' => "1398",
            'clientip' => "127.0.0.1",
            'date_hour' => "11",
            'date_mday' => "19",
            'date_minute' => "55",
            'date_month' => "december",
            'date_second' => "39",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "-480",
            'earliest' => "rt-1h",
            'file' => "shelper",
            'host' => "fross-mbp15.local",
            'ident' => "-",
            'index' => "_internal",
            'latest' => "rt",
            'linecount' => "1",
            'method' => "POST",
            'other' => "- 50d21bbb4b5224c10 3ms",
            'punct' => "..._-__[//:::._-]_\"_/-//_/.\"___\"://:/-///?=%%%%%%%",
            'q' => "search%20search%20index%3D_internal%20%7C%20head%2010",
            'referer' => "http://localhost:8000/en-US/app/search/" +
                "flashtimeline?q=search%20search%20index%3D_internal%20%7C" +
                "%20head%2010&earliest=rt-1h&latest=rt",
            'referer_domain' => "http://localhost:8000",
            'req_time' => "19/Dec/2012:11:55:39.296 -0800",
            'root' => "en-US",
            'source' => "/Users/fross/splunks/splunk-4.3.5/var/log/splunk" +
                "/web_access.log",
            'sourcetype' => "splunk_web_access",
            'spent' => "3",
            'splunk_server' => "fross-mbp15.local",
            'status' => "200",
            'timeendpos' => "49",
            'timestartpos' => "19",
            'uri' => "/en-US/api/shelper",
            'uri_path' => "/en-US/api/shelper",
            'user' => "admin",
            'useragent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;" +
                " rv:17.0) Gecko/20100101 Firefox/17.0",
            'version' => "HTTP/1.1",
        },
        {
            '_cd' => "54:23689",
            '_indextime' => "1355946940",
            '_kv' => "1",
            '_raw' => "127.0.0.1 - admin [19/Dec/2012:11:55:39.265 -0800]" +
                " \"GET /services/<sg h=\"1\">search</sg>/jobs/rt_1355946914" +
                ".13 HTTP/1.1\" 200 10957 - - - 4ms",
            '_serial' => "1",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunkd_access",
            '_subsecond' => ".265",
            '_time' => "2012-12-19T11:55:39.265-08:00",
            'bytes' => "10957",
            'clientip' => "127.0.0.1",
            'date_hour' => "11",
            'date_mday' => "19",
            'date_minute' => "55",
            'date_month' => "december",
            'date_second' => "39",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "-480",
            'eventtype' => "splunkd-access",
            'file' => "rt_1355946914.13",
            'host' => "fross-mbp15.local",
            'ident' => "-",
            'index' => "_internal",
            'linecount' => "1",
            'method' => "GET",
            'other' => "- - - 4ms",
            'punct' => "..._-__[//:::._-]_\"_////._/.\"___-_-_-_",
            'req_time' => "19/Dec/2012:11:55:39.265 -0800",
            'root' => "services",
            'source' => "/Users/fross/splunks/splunk-4.3.5/var/log/" +
                "splunk/splunkd_access.log",
            'sourcetype' => "splunkd_access",
            'spent' => "4",
            'splunk_server' => "fross-mbp15.local",
            'status' => "200",
            'timeendpos' => "49",
            'timestartpos' => "19",
            'uri' => "/services/search/jobs/rt_1355946914.13",
            'uri_path' => "/services/search/jobs/rt_1355946914.13",
            'user' => "admin",
            'version' => "HTTP/1.1",
        },
        {
            '_cd' => "54:23682",
            '_indextime' => "1355946940",
            '_kv' => "1",
            '_raw' => "127.0.0.1 - admin [19/Dec/2012:11:55:39.258 -0800]" +
                " \"GET /servicesNS/admin/<sg h=\"1\">search</sg>/properties" +
                "/event_renderers?fillcontents=1 HTTP/1.1\" 200 3657 - - - 1ms",
            '_serial' => "2",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunkd_access",
            '_subsecond' => ".258",
            '_time' => "2012-12-19T11:55:39.258-08:00",
            'bytes' => "3657",
            'clientip' => "127.0.0.1",
            'date_hour' => "11",
            'date_mday' => "19",
            'date_minute' => "55",
            'date_month' => "december",
            'date_second' => "39",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "-480",
            'eventtype' => "splunkd-access",
            'file' => "event_renderers",
            'fillcontents' => "1",
            'host' => "fross-mbp15.local",
            'ident' => "-",
            'index' => "_internal",
            'linecount' => "1",
            'method' => "GET",
            'other' => "- - - 1ms",
            'punct' => "..._-__[//:::._-]_\"_/////?=_/.\"___-_-_-_",
            'req_time' => "19/Dec/2012:11:55:39.258 -0800",
            'root' => "servicesNS",
            'source' => "/Users/fross/splunks/splunk-4.3.5/var/log/splunk/" +
                "splunkd_access.log",
            'sourcetype' => "splunkd_access",
            'spent' => "1",
            'splunk_server' => "fross-mbp15.local",
            'status' => "200",
            'timeendpos' => "49",
            'timestartpos' => "19",
            'uri' => "/servicesNS/admin/search/properties/event_renderers" +
                "?fillcontents=1",
            'uri_path' => "/servicesNS/admin/search/properties/event_renderers",
            'uri_query' => "fillcontents=1",
            'user' => "admin",
            'version' => "HTTP/1.1",
        },
        {
            '_cd' => "54:23670",
            '_indextime' => "1355946940",
            '_kv' => "1",
            '_raw' => "127.0.0.1 - admin [19/Dec/2012:11:55:39.231 -0800]" +
                " \"GET /services/<sg h=\"1\">search</sg>/jobs/rt_1355946914" +
                ".13/events?count=0&segmentation=full&output_mode=xml&" +
                "time_format=%25s.%25Q&max_lines=10&show_empty_fields=True&" +
                "offset=-10&output_time_format=%25Y-%25m-%25dT%25H%3A%25M" +
                "%3A%25S.%25Q%25z&field_list=&truncation_mode=abstract" +
                " HTTP/1.1\" 200 32837 - - - 6ms",
            '_serial' => "3",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunkd_access",
            '_subsecond' => ".231",
            '_time' => "2012-12-19T11:55:39.231-08:00",
            'bytes' => "32837",
            'clientip' => "127.0.0.1",
            'count' => "0",
            'date_hour' => "11",
            'date_mday' => "19",
            'date_minute' => "55",
            'date_month' => "december",
            'date_second' => "39",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "-480",
            'eventtype' => "splunkd-access",
            'file' => "events",
            'host' => "fross-mbp15.local",
            'ident' => "-",
            'index' => "_internal",
            'linecount' => "1",
            'max_lines' => "10",
            'method' => "GET",
            'offset' => "-10",
            'other' => "- - - 6ms",
            'output_mode' => "xml",
            'output_time_format' => "%25Y-%25m-%25dT%25H%3A%25M%3A%25S.%25Q%25z",
            'punct' => "..._-__[//:::._-]_\"_////./?=&=&=&=%.%&=&=&=-&=%-%-",
            'req_time' => "19/Dec/2012:11:55:39.231 -0800",
            'root' => "services",
            'segmentation' => "full",
            'show_empty_fields' => "True",
            'source' => "/Users/fross/splunks/splunk-4.3.5/var/log/splunk" +
                "/splunkd_access.log",
            'sourcetype' => "splunkd_access",
            'spent' => "6",
            'splunk_server' => "fross-mbp15.local",
            'status' => "200",
            'time_format' => "%25s.%25Q",
            'timeendpos' => "49",
            'timestartpos' => "19",
            'truncation_mode' => "abstract",
            'uri' => "/services/search/jobs/rt_1355946914.13/events?count=0" +
                "&segmentation=full&output_mode=xml&time_format=%25s.%25Q" +
                "&max_lines=10&show_empty_fields=True&offset=-10&output_" +
                "time_format=%25Y-%25m-%25dT%25H%3A%25M%3A%25S.%25Q%25z" +
                "&field_list=&truncation_mode=abstract",
            'uri_path' => "/services/search/jobs/rt_1355946914.13/events",
            'uri_query' => "count=0&segmentation=full&output_mode=xml&time" +
                "_format=%25s.%25Q&max_lines=10&show_empty_fields=True&" +
                "offset=-10&output_time_format=%25Y-%25m-%25dT%25H%3A%25M" +
                "%3A%25S.%25Q%25z&field_list=&truncation_mode=abstract",
            'user' => "admin",
            'version' => "HTTP/1.1",
        }
    ]

    n_results = 0
    reader.each_with_index do |result, index|
      n_results += 1
      expected_results[index].each_entry do |key, value|
        assert_equal([key, value], [key, result[key]])
      end
      assert_equal(expected_results[index], result)
    end

    assert_equal(4, n_results)
  end

  def test_43_results_preview
    file = File.open("test/data/results/4.3.5/results-preview.xml")
    reader = Splunk::ResultsReader.new(file)
    assert_true(reader.is_preview?)

    expected_fields = ["_cd", "_indextime", "_kv", "_raw", "_serial", "_si",
                       "_sourcetype", "_subsecond", "_time",
                       "active_hist_searches", "active_realtime_searches",
                       "app", "appCodeName", "appName", "browser", "bytes",
                       "class", "client_app", "clientip", "component", "count",
                       "date_hour", "date_mday", "date_minute", "date_month",
                       "date_second", "date_wday", "date_year", "date_zone",
                       "delimiter", "display_row_numbers", "drop_count",
                       "earliest", "enable_event_actions",
                       "enable_field_actions", "entity_name", "eventtype",
                       "field_list", "fields", "file", "fillcontents", "group",
                       "host", "ident", "index", "jobStatus", "latest", "line",
                       "linecount", "log_level", "max_lines",
                       "max_lines_constraint", "max_time",
                       "mean_preview_period", "message", "message_level",
                       "method", "min_freq", "min_lines", "name", "namespace",
                       "offset", "other", "output_mode", "output_time_format",
                       "platform", "prefix", "punct", "q", "referer",
                       "referer_domain", "req_time", "requestid",
                       "reverse_order", "root", "s", "search", "segmentation",
                       "show_empty_fields", "sid", "sortDir", "sortKey",
                       "sort_dir", "sort_key", "source", "sourcetype", "spent",
                       "splunk_server", "staticFields", "status",
                       "time_format", "timeendpos", "timestartpos",
                       "truncation_mode", "uri", "uri_path", "uri_query",
                       "user", "userAgent", "useragent", "version"]
    assert_equal(expected_fields, reader.fields)

    expected_results = [
        {
            '_cd' => "54:8568",
            '_indextime' => "1355946537",
            '_kv' => "1",
            '_raw' => "2012-12-19 11:48:55,424 INFO	[50d21a262616082d0]" +
                " root:535 - CONFIG: mrsparkle_path (str): /Users/fross/" +
                "splunks/splunk-4.3.5/share/<sg h=\"1\">search</sg>/mrsparkle",
            '_serial' => "731",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunk_web_service",
            '_subsecond' => ".424",
            '_time' => "2012-12-19T11:48:55.424-08:00",
            'component' => "root",
            'date_hour' => "11",
            'date_mday' => "19",
            'date_minute' => "48",
            'date_month' => "december",
            'date_second' => "55",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "local",
            'host' => "fross-mbp15.local",
            'index' => "_internal",
            'line' => "535",
            'linecount' => "1",
            'log_level' => "INFO",
            'message' => "CONFIG: mrsparkle_path (str): /Users/fross/splunks/" +
                "splunk-4.3.5/share/search/mrsparkle",
            'punct' => "--_::,_t[]_:_-_:__():_////-..///",
            'requestid' => "50d21a262616082d0",
            'source' => "/Users/fross/splunks/splunk-4.3.5/var/log/splunk/" +
                "web_service.log",
            'sourcetype' => "splunk_web_service",
            'splunk_server' => "fross-mbp15.local",
            'timeendpos' => "24",
            'timestartpos' => "0",
        },
        {
            '_cd' => "54:8562",
            '_indextime' => "1355946537",
            '_kv' => "1",
            '_raw' => "2012-12-19 11:48:55,424 INFO\t[50d21a262616082d0]" +
                " root:535 - CONFIG: module_dir (str): share/splunk/<sg" +
                " h=\"1\">search</sg>_mrsparkle/modules",
            '_serial' => "732",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunk_web_service",
            '_subsecond' => ".424",
            '_time' => "2012-12-19T11:48:55.424-08:00",
            'component' => "root",
            'date_hour' => "11",
            'date_mday' => "19",
            'date_minute' => "48",
            'date_month' => "december",
            'date_second' => "55",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "local",
            'host' => "fross-mbp15.local",
            'index' => "_internal",
            'line' => "535",
            'linecount' => "1",
            'log_level' => "INFO",
            'message' => "CONFIG: module_dir (str): share/splunk/" +
                "search_mrsparkle/modules",
            'punct' => "--_::,_t[]_:_-_:__():_///",
            'requestid' => "50d21a262616082d0",
            'source' => "/Users/fross/splunks/splunk-4.3.5/var/log/" +
                "splunk/web_service.log",
            'sourcetype' => "splunk_web_service",
            'splunk_server' => "fross-mbp15.local",
            'timeendpos' => "24",
            'timestartpos' => "0",
        },
        {
            '_cd' => "54:8674",
            '_indextime' => "1355946537",
            '_kv' => "1",
            '_raw' => "2012-12-19 11:48:55,425 INFO\t[50d21a262616082d0]" +
                " root:535 - CONFIG: template_dir (str): share/splunk/" +
                "<sg h=\"1\">search</sg>_mrsparkle/templates",
            '_serial' => "728",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunk_web_service",
            '_subsecond' => ".425",
            '_time' => "2012-12-19T11:48:55.425-08:00",
            'component' => "root",
            'date_hour' => "11",
            'date_mday' => "19",
            'date_minute' => "48",
            'date_month' => "december",
            'date_second' => "55",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "local",
            'host' => "fross-mbp15.local",
            'index' => "_internal",
            'line' => "535",
            'linecount' => "1",
            'log_level' => "INFO",
            'message' => "CONFIG: template_dir (str): share/splunk/" +
                "search_mrsparkle/templates",
            'punct' => "--_::,_t[]_:_-_:__():_///",
            'requestid' => "50d21a262616082d0",
            'source' => "/Users/fross/splunks/splunk-4.3.5/var/log/" +
                "splunk/web_service.log",
            'sourcetype' => "splunk_web_service",
            'splunk_server' => "fross-mbp15.local",
            'timeendpos' => "24",
            'timestartpos' => "0",
        },
        {
            '_cd' => "54:8662",
            '_indextime' => "1355946537",
            '_kv' => "1",
            '_raw' => "2012-12-19 11:48:55,425 INFO\t[50d21a262616082d0]" +
                " root:535 - CONFIG: staticdir (str): /Users/fross/splunks" +
                "/splunk-4.3.5/share/splunk/<sg h=\"1\">search</sg>_mrsparkle" +
                "/exposed",
            '_serial' => "729",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunk_web_service",
            '_subsecond' => ".425",
            '_time' => "2012-12-19T11:48:55.425-08:00",
            'component' => "root",
            'date_hour' => "11",
            'date_mday' => "19",
            'date_minute' => "48",
            'date_month' => "december",
            'date_second' => "55",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "local",
            'host' => "fross-mbp15.local",
            'index' => "_internal",
            'line' => "535",
            'linecount' => "1",
            'log_level' => "INFO",
            'message' => "CONFIG: staticdir (str): /Users/fross/splunks/" +
                "splunk-4.3.5/share/splunk/search_mrsparkle/exposed",
            'punct' => "--_::,_t[]_:_-_:__():_////-..////",
            'requestid' => "50d21a262616082d0",
            'source' => "/Users/fross/splunks/splunk-4.3.5/var/log/" +
                "splunk/web_service.log",
            'sourcetype' => "splunk_web_service",
            'splunk_server' => "fross-mbp15.local",
            'timeendpos' => "24",
            'timestartpos' => "0",
        },
        {
            '_cd' => "54:8651",
            '_indextime' => "1355946537",
            '_kv' => "1",
            '_raw' => "2012-12-19 11:48:55,425 INFO\t[50d21a262616082d0]" +
                " root:535 - CONFIG: static_dir (str): share/splunk/" +
                "<sg h=\"1\">search</sg>_mrsparkle/exposed",
            '_serial' => "730",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunk_web_service",
            '_subsecond' => ".425",
            '_time' => "2012-12-19T11:48:55.425-08:00",
            'component' => "root",
            'date_hour' => "11",
            'date_mday' => "19",
            'date_minute' => "48",
            'date_month' => "december",
            'date_second' => "55",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "local",
            'host' => "fross-mbp15.local",
            'index' => "_internal",
            'line' => "535",
            'linecount' => "1",
            'log_level' => "INFO",
            'message' => "CONFIG: static_dir (str): share/splunk/" +
                "search_mrsparkle/exposed",
            'punct' => "--_::,_t[]_:_-_:__():_///",
            'requestid' => "50d21a262616082d0",
            'source' => "/Users/fross/splunks/splunk-4.3.5/var/log/" +
                "splunk/web_service.log",
            'sourcetype' => "splunk_web_service",
            'splunk_server' => "fross-mbp15.local",
            'timeendpos' => "24",
            'timestartpos' => "0",
        },
        {
            '_cd' => "54:9267",
            '_indextime' => "1355946552",
            '_kv' => "1",
            '_raw' => "12-19-2012 11:49:12.313 -0800 INFO  Metrics" +
                " - group=<sg h=\"1\">search</sg>_concurrency, system total," +
                " active_hist_searches=0, active_realtime_searches=0",
            '_serial' => "726",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunkd",
            '_subsecond' => ".313",
            '_time' => "2012-12-19T11:49:12.313-08:00",
            'active_hist_searches' => "0",
            'active_realtime_searches' => "0",
            'component' => "Metrics",
            'date_hour' => "11",
            'date_mday' => "19",
            'date_minute' => "49",
            'date_month' => "december",
            'date_second' => "12",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "-480",
            'group' => "search_concurrency",
            'host' => "fross-mbp15.local",
            'index' => "_internal",
            'linecount' => "1",
            'log_level' => "INFO",
            'message' => "group=search_concurrency, system total, " +
                "active_hist_searches=0, active_realtime_searches=0",
            'punct' => "--_::._-____-_=,__,_=,_=",
            'source' => "/Users/fross/splunks/splunk-4.3.5/var/log/" +
                "splunk/metrics.log",
            'sourcetype' => "splunkd",
            'splunk_server' => "fross-mbp15.local",
            'timeendpos' => "29",
            'timestartpos' => "0",
        },
        {
            '_cd' => "54:9262",
            '_indextime' => "1355946552",
            '_kv' => "1",
            '_raw' => "12-19-2012 11:49:12.313 -0800 INFO  Metrics" +
                " - group=realtime_<sg h=\"1\">search</sg>_data," +
                " system total, drop_count=0",
            '_serial' => "727",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunkd",
            '_subsecond' => ".313",
            '_time' => "2012-12-19T11:49:12.313-08:00",
            'component' => "Metrics",
            'date_hour' => "11",
            'date_mday' => "19",
            'date_minute' => "49",
            'date_month' => "december",
            'date_second' => "12",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "-480",
            'drop_count' => "0",
            'group' => "realtime_search_data",
            'host' => "fross-mbp15.local",
            'index' => "_internal",
            'linecount' => "1",
            'log_level' => "INFO",
            'message' => "group=realtime_search_data, system total," +
                " drop_count=0",
            'punct' => "--_::._-____-_=,__,_=",
            'source' => "/Users/fross/splunks/splunk-4.3.5/var/log/" +
                "splunk/metrics.log",
            'sourcetype' => "splunkd",
            'splunk_server' => "fross-mbp15.local",
            'timeendpos' => "29",
            'timestartpos' => "0",
        },
        {
            '_cd' => "54:9769",
            '_indextime' => "1355946583",
            '_kv' => "1",
            '_raw' => "12-19-2012 11:49:43.322 -0800 INFO  Metrics" +
                " - group=<sg h=\"1\">search</sg>_concurrency, system total," +
                " active_hist_searches=0, active_realtime_searches=0",
            '_serial' => "724",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunkd",
            '_subsecond' => ".322",
            '_time' => "2012-12-19T11:49:43.322-08:00",
            'active_hist_searches' => "0",
            'active_realtime_searches' => "0",
            'component' => "Metrics",
            'date_hour' => "11",
            'date_mday' => "19",
            'date_minute' => "49",
            'date_month' => "december",
            'date_second' => "43",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "-480",
            'group' => "search_concurrency",
            'host' => "fross-mbp15.local",
            'index' => "_internal",
            'linecount' => "1",
            'log_level' => "INFO",
            'message' => "group=search_concurrency, system total," +
                " active_hist_searches=0, active_realtime_searches=0",
            'punct' => "--_::._-____-_=,__,_=,_=",
            'source' => "/Users/fross/splunks/splunk-4.3.5/var/log/" +
                "splunk/metrics.log",
            'sourcetype' => "splunkd",
            'splunk_server' => "fross-mbp15.local",
            'timeendpos' => "29",
            'timestartpos' => "0",
        },
        {
            '_cd' => "54:9764",
            '_indextime' => "1355946583",
            '_kv' => "1",
            '_raw' => "12-19-2012 11:49:43.322 -0800 INFO  Metrics" +
                " - group=realtime_<sg h=\"1\">search</sg>_data, system" +
                " total, drop_count=0",
            '_serial' => "725",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunkd",
            '_subsecond' => ".322",
            '_time' => "2012-12-19T11:49:43.322-08:00",
            'component' => "Metrics",
            'date_hour' => "11",
            'date_mday' => "19",
            'date_minute' => "49",
            'date_month' => "december",
            'date_second' => "43",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "-480",
            'drop_count' => "0",
            'group' => "realtime_search_data",
            'host' => "fross-mbp15.local",
            'index' => "_internal",
            'linecount' => "1",
            'log_level' => "INFO",
            'message' => "group=realtime_search_data, system total," +
                " drop_count=0",
            'punct' => "--_::._-____-_=,__,_=",
            'source' => "/Users/fross/splunks/splunk-4.3.5/var/log/" +
                "splunk/metrics.log",
            'sourcetype' => "splunkd",
            'splunk_server' => "fross-mbp15.local",
            'timeendpos' => "29",
            'timestartpos' => "0",
        },
        {
            '_cd' => "54:10097",
            '_indextime' => "1355946614",
            '_kv' => "1",
            '_raw' => "12-19-2012 11:50:14.351 -0800 INFO  Metrics" +
                " - group=<sg h=\"1\">search</sg>_concurrency, system total," +
                " active_hist_searches=0, active_realtime_searches=0",
            '_serial' => "722",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunkd",
            '_subsecond' => ".351",
            '_time' => "2012-12-19T11:50:14.351-08:00",
            'active_hist_searches' => "0",
            'active_realtime_searches' => "0",
            'component' => "Metrics",
            'date_hour' => "11",
            'date_mday' => "19",
            'date_minute' => "50",
            'date_month' => "december",
            'date_second' => "14",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "-480",
            'group' => "search_concurrency",
            'host' => "fross-mbp15.local",
            'index' => "_internal",
            'linecount' => "1",
            'log_level' => "INFO",
            'message' => "group=search_concurrency, system total," +
                " active_hist_searches=0, active_realtime_searches=0",
            'punct' => "--_::._-____-_=,__,_=,_=",
            'source' => "/Users/fross/splunks/splunk-4.3.5/var/log/" +
                "splunk/metrics.log",
            'sourcetype' => "splunkd",
            'splunk_server' => "fross-mbp15.local",
            'timeendpos' => "29",
            'timestartpos' => "0",
        }
    ]

    n_results = 0
    reader.each_with_index do |result, index|
      n_results += 1
      expected_results[index].each_entry do |key, value|
        assert_equal([index, key, value], [index, key, result[key]])
      end
      assert_equal(expected_results[index], result)
    end

    assert_equal(10, n_results)
  end

  def test_43_results_empty
    file = File.open("test/data/results/4.3.5/results-empty.xml")
    reader = Splunk::ResultsReader.new(file)
    assert_nil(reader.is_preview?)
    assert_equal([], reader.fields)

    n_results = 0
    reader.each do |result|
      n_results += 1
    end
    assert_equal(0, n_results)
  end

  def test_42_results_empty
    file = File.open("test/data/results/4.2.5/results-empty.xml")
    reader = Splunk::ResultsReader.new(file)
    assert_nil(reader.is_preview?)
    assert_equal([], reader.fields)

    n_results = 0
    reader.each do |result|
      n_results += 1
    end
    assert_equal(0, n_results)
  end

  def test_42_results_preview
    file = File.open("test/data/results/4.2.5/results-preview.xml")
    reader = Splunk::ResultsReader.new(file)
    assert_true(reader.is_preview?)

    expected_fields = ['_indextime', '_kv', '_raw', '_serial', '_sourcetype',
                       '_subsecond', '_time', 'active_streams', 'blocking',
                       'bytes', 'client_app', 'clientip', 'component', 'count',
                       'date_hour', 'date_mday', 'date_minute', 'date_month',
                       'date_second', 'date_wday', 'date_year', 'date_zone',
                       'display_row_numbers', 'earliest',
                       'enable_event_actions', 'enable_field_actions',
                       'entity_name', 'eventtype', 'field_list', 'file',
                       'fillcontents', 'filter', 'host', 'ident', 'index',
                       'length', 'linecount', 'log_level', 'max_block_secs',
                       'max_lines', 'max_lines_constraint', 'max_pages',
                       'message', 'method', 'min_freq', 'min_lines', 'offset',
                       'other', 'output_mode', 'output_time_format', 'punct',
                       'q', 'queue_size', 'referer', 'referer_domain',
                       'req_time', 'reverse_order', 'root', 's', 'segmentation',
                       'show_empty_fields', 'sid', 'source', 'sourcetype',
                       'spent', 'splunk_server', 'status', 'time_format',
                       'timeendpos', 'timestartpos', 'truncation_mode', 'uri',
                       'uri_path', 'uri_query', 'user', 'useragent', 'version']
    assert_equal(reader.fields, expected_fields)

    expected_results = [
        {
            '_indextime' => "1355947338",
            '_kv' => "1",
            '_raw' => "12-19-2012 12:02:18.172 -0800 INFO  IndexProcessor" +
                " - rtsearch connection established, filter = '[ " +
                "AND <sg h=\"1\">index::_internal</sg> <sg h=\"1\">search</sg> ]', active_streams = 1, " +
                "queue_size = 10000, blocking = FALSE, max_block_secs = 0",
            '_serial' => "0",
            '_sourcetype' => "splunkd",
            '_subsecond' => ".172",
            '_time' => "2012-12-19T12:02:18.172-08:00",
            'active_streams' => "1",
            'blocking' => "FALSE",
            'component' => "IndexProcessor",
            'date_hour' => "12",
            'date_mday' => "19",
            'date_minute' => "2",
            'date_month' => "december",
            'date_second' => "18",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "-480",
            'eventtype' => "splunkd-log",
            'filter' => "'[ AND index::_internal search ]'",
            'host' => "fross-mbp15.local",
            'index' => "_internal",
            'linecount' => "1",
            'log_level' => "INFO",
            'max_block_secs' => "0",
            'message' => "rtsearch connection established, filter = '[ " +
                "AND index::_internal search ]', active_streams = 1, " +
                "queue_size = 10000, blocking = FALSE, max_block_secs = 0",
            'punct' => "--_::._-____-___,__=_'[__::__]',__=_,__=_,__=_,__=",
            'queue_size' => "10000",
            'source' => "/Users/fross/splunks/splunk-4.2.5.6/var/log/" +
                "splunk/splunkd.log",
            'sourcetype' => "splunkd",
            'splunk_server' => "fross-mbp15.local",
            'timeendpos' => "29",
            'timestartpos' => "11",
        },
        {
            '_indextime' => "1355947338",
            '_kv' => "1",
            '_raw' => "2012-12-19 12:02:18,066 - admin	<sg h=\"1\">search</sg> <sg h=\"1\">search</sg> " +
                "index=_internal | head 10",
            '_serial' => "1",
            '_sourcetype' => "searches",
            '_subsecond' => ".066",
            '_time' => "2012-12-19T12:02:18.066-08:00",
            'date_hour' => "12",
            'date_mday' => "19",
            'date_minute' => "2",
            'date_month' => "december",
            'date_second' => "18",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "local",
            'host' => "fross-mbp15.local",
            'index' => "_internal",
            'linecount' => "1",
            'punct' => "--_::,_-_t__=_|__",
            'source' => "/Users/fross/splunks/splunk-4.2.5.6/var/log/" +
                "splunk/searches.log",
            'sourcetype' => "searches",
            'splunk_server' => "fross-mbp15.local",
            'timeendpos' => "24",
            'timestartpos' => "11",
        }
    ]

    n_results = 0
    reader.each_with_index do |result, index|
      n_results += 1
      assert_equal(expected_results[index], result)
    end

    assert_equal(2, n_results)
  end

  def test_42_results
    file = File.open("test/data/results/4.2.5/results.xml")
    reader = Splunk::ResultsReader.new(file)
    assert_false(reader.is_preview?)

    expected_fields = ['_cd', '_indextime', '_kv', '_raw', '_serial', '_si',
                       '_sourcetype', '_subsecond', '_time',
                       'active_hist_searches', 'active_realtime_searches',
                       'alert_actions', 'app', 'autoload', 'bytes', 'clientip',
                       'component', 'cookie', 'date_hour', 'date_mday',
                       'date_minute', 'date_month', 'date_second', 'date_wday',
                       'date_year', 'date_zone', 'dispatch_time', 'drop_count',
                       'earliest', 'eventtype', 'file', 'group', 'host',
                       'ident', 'index', 'line', 'linecount', 'log_level',
                       'message', 'method', 'other', 'punct', 'q', 'referer',
                       'referer_domain', 'req_time', 'requestid',
                       'result_count', 'return_to', 'root', 'run_time',
                       'savedsearch_id', 'savedsearch_name', 'scheduled_time',
                       'sid', 'source', 'sourcetype', 'spent', 'splunk_server',
                       'status', 'suppressed', 'thread_id', 'timeendpos',
                       'timestartpos', 'trigger_condition_state', 'uri',
                       'uri_domain', 'uri_path', 'uri_query', 'user',
                       'useragent', 'version']
    assert_equal(expected_fields, reader.fields)

    expected_results = [
        {
            '_cd' => "1:5282",
            '_indextime' => "1355947283",
            '_kv' => "1",
            '_raw' => "127.0.0.1 - admin [19/Dec/2012:12:01:22.845 -0800] " +
                "\"GET /services/<sg h=\"1\">search</sg>/timeparser/tz " +
                "HTTP/1.1\" 200 2891 - - - 1ms",
            '_serial' => "0",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunkd_access",
            '_subsecond' => ".845",
            '_time' => "2012-12-19T12:01:22.845-08:00",
            'bytes' => "2891",
            'clientip' => "127.0.0.1",
            'date_hour' => "12",
            'date_mday' => "19",
            'date_minute' => "1",
            'date_month' => "december",
            'date_second' => "22",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "-480",
            'eventtype' => "splunkd-access",
            'file' => "tz",
            'host' => "fross-mbp15.local",
            'ident' => "-",
            'index' => "_internal",
            'linecount' => "1",
            'method' => "GET",
            'other' => "- - - 1ms",
            'punct' => "..._-__[//:::._-]_\"_////_/.\"___-_-_-_",
            'req_time' => "19/Dec/2012:12:01:22.845 -0800",
            'root' => "services",
            'source' => "/Users/fross/splunks/splunk-4.2.5.6/var/log/splunk/splunkd_access.log",
            'sourcetype' => "splunkd_access",
            'spent' => "1",
            'splunk_server' => "fross-mbp15.local",
            'status' => "200",
            'timeendpos' => "49",
            'timestartpos' => "31",
            'uri' => "/services/search/timeparser/tz",
            'uri_path' => "/services/search/timeparser/tz",
            'user' => "admin",
            'version' => "HTTP/1.1",
        }, {
            '_cd' => "1:5211",
            '_indextime' => "1355947283",
            '_kv' => "1",
            '_raw' => "127.0.0.1 - admin [19/Dec/2012:12:01:22.762 -0800] " +
                "\"POST /en-US/account/login HTTP/1.1\" 200 1897 \"http:" +
                "//localhost:8000/en-US/account/login?return_to=%2Fen-US" +
                "%2Fapp%2Fsearch%2Fflashtimeline%3Fq%3D<sg h=\"1\">search" +
                "</sg>%2520<sg h=\"1\">search</sg>" +
                "%2520index%253D_internal%2520%257C%2520head%252010%26" +
                "earliest%3D0\" \"Mozilla/5.0 (Macintosh; Intel Mac OS X " +
                "10.7; rv:17.0) Gecko/20100101 Firefox/17.0\" - " +
                "50d21d12c31e60610 35ms",
            '_serial' => "1",
            '_si' => ["fross-mbp15.local", "_internal"],
            '_sourcetype' => "splunk_web_access",
            '_subsecond' => ".762",
            '_time' => "2012-12-19T12:01:22.762-08:00",
            'bytes' => "1897",
            'clientip' => "127.0.0.1",
            'date_hour' => "12",
            'date_mday' => "19",
            'date_minute' => "1",
            'date_month' => "december",
            'date_second' => "22",
            'date_wday' => "wednesday",
            'date_year' => "2012",
            'date_zone' => "-480",
            'file' => "login",
            'host' => "fross-mbp15.local",
            'ident' => "-",
            'index' => "_internal",
            'linecount' => "1",
            'method' => "POST",
            'other' => "- 50d21d12c31e60610 35ms",
            'punct' => "..._-__[//:::._-]_\"_/-//_/.\"___\"://:/-//?=%-%%%%%%",
            'referer' => "http://localhost:8000/en-US/account/login?return_to" +
                "=%2Fen-US%2Fapp%2Fsearch%2Fflashtimeline%3Fq%3Dsearch%2520" +
                "search%2520index%253D_internal%2520%257C%2520head%252010%26" +
                "earliest%3D0",
            'referer_domain' => "http://localhost:8000",
            'req_time' => "19/Dec/2012:12:01:22.762 -0800",
            'return_to' => "%2Fen-US%2Fapp%2Fsearch%2Fflashtimeline%3Fq%3D" +
                "search%2520search%2520index%253D_internal%2520%257C%2520" +
                "head%252010%26earliest%3D0",
            'root' => "en-US",
            'source' => "/Users/fross/splunks/splunk-4.2.5.6/var/log/splunk/" +
                "web_access.log",
            'sourcetype' => "splunk_web_access",
            'spent' => "35",
            'splunk_server' => "fross-mbp15.local",
            'status' => "200",
            'timeendpos' => "49",
            'timestartpos' => "31",
            'uri' => "/en-US/account/login",
            'uri_path' => "/en-US/account/login",
            'user' => "admin",
            'useragent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:17.0) Gecko/20100101 Firefox/17.0",
            'version' => "HTTP/1.1",
        }
    ]

    n_results = 0
    reader.each_with_index do |result, index|
      n_results += 1
      expected_results[index].each_entry do |key, value|
        assert_equal([key, value], [key, result[key]])
      end
      assert_equal(expected_results[index], result)
    end

    assert_equal(2, n_results)
  end
end