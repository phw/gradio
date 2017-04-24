/* This file is part of Gradio.
 *
 * Gradio is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Gradio is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Gradio.  If not, see <http://www.gnu.org/licenses/>.
 */

using Gtk;

namespace Gradio{

	[GtkTemplate (ui = "/de/haecker-felix/gradio/ui/page/discover-page.ui")]
	public class DiscoverPage : Gtk.Box, Page{

		[GtkChild] private Box FeaturedBox;
		[GtkChild] private Box PopularStationsBox;

		public DiscoverPage(){
			setup_view();
		}

		private void setup_view(){
			StationModel popular_stations = new StationModel();
			StationProvider popular_stations_provider = new StationProvider(ref popular_stations, 5);
			popular_stations_provider.set_address(RadioBrowser.radio_stations_most_votes);

			MainBox popular_stations_box = new MainBox();
			popular_stations_box.set_model(popular_stations);

			RadioStation test = new RadioStation("Deutschland Radio");

			FeaturedTileStack featured_tile_stack = new FeaturedTileStack(ref popular_stations);


			FeaturedBox.pack_start(featured_tile_stack);
			PopularStationsBox.pack_start(popular_stations_box);
		}
	}
}
