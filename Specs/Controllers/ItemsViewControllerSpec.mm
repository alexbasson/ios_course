#import "ItemsViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ItemsViewControllerSpec)

describe(@"ItemsViewController", ^{
    __block ItemsViewController *controller;

    beforeEach(^{
        controller = [[ItemsViewController alloc] init];
        controller.view should_not be_nil;
    });

    describe(@"displaying the table view", ^{
        __block NSArray *cells;

        beforeEach(^{
            [controller.tableView layoutIfNeeded];
            cells = controller.tableView.visibleCells;
        });

        it(@"should display cells with data", ^{
            ((UITableViewCell *)cells[0]).textLabel.text should equal(@"Cell 0");
            ((UITableViewCell *)cells[1]).textLabel.text should equal(@"Cell 1");
        });
    });
});

SPEC_END
