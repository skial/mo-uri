package ;

import utest.Runner;
import utest.ui.Report;

class Main {

    public static function main() {
        var runner = new Runner();
        runner.addCase( new UriSpec() );
        Report.create( runner );
		runner.run();
    }

}
